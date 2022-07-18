import 'dart:async';

import "package:flutter/material.dart";
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:google_place/google_place.dart';
import 'package:sanchari/Models/busDetails_model.dart';
import 'package:sanchari/UI/Home/qrCode.dart';
import 'package:sanchari/constants.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

class UpdateBusDetails extends StatefulWidget {
  const UpdateBusDetails({Key? key}) : super(key: key);

  @override
  State<UpdateBusDetails> createState() => _UpdateBusDetailsState();
}

class _UpdateBusDetailsState extends State<UpdateBusDetails> {
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  BusDetail busDetail = BusDetail();

  late TextEditingController _placeController;
  late String _selectedLocation;
  DetailsResult? startPosition;
  late FocusNode startFocusNode;

  late GooglePlace googlePlace;
  List<AutocompletePrediction> predictions = [];

  bool _searched = true;

  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    this._placeController = new TextEditingController();

    String apiKey = 'AIzaSyCslHZgsw_rDgdBsRSz2JSqHkMldK0p9Ig';
    googlePlace = GooglePlace(apiKey);

    startFocusNode = FocusNode();
    busDetail.busStops = new List<String>.empty(growable: true);
    busDetail.isActive = false;
    busDetail.busStops!.add("");
  }

  @override
  void dispose() {
    _placeController.dispose();
    startFocusNode.dispose();
    super.dispose();
  }

  void autoCompleteSearch(String value) async {
    var result = await googlePlace.autocomplete.get(value);
    if (result != null && result.predictions != null && mounted) {
      print(result.predictions!.first.description);
      Iterable<String> s = [];
      setState(() {
        predictions = result.predictions!;
      });
    } else {
      print("cool");
    }
  }

  void searchFunc() {
    setState(() {
      _searched = !_searched;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? kLightSecondaryColor
          : kDarkPrimaryColor,
      appBar: AppBar(
        title: Text('Track Bus'),
        backgroundColor: const Color(0xffE3002C),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Container(
            width: screenWidth * 0.7,
            height: 50,
            child: ElevatedButton.icon(
              onPressed: () {
                // Respond to button press
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Qrcode()),
                );
              },
              label: Text("Scan With QR Code"),
              icon: Icon(Icons.qr_code_scanner_sharp, size: 18),
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Current Bus Status",
                style: TextStyle(
                    color: Color.fromARGB(136, 46, 38, 63),
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              Switch(
                value: busDetail.isActive!,
                onChanged: (value) {
                  setState(() {
                    busDetail.isActive = value;
                  });
                },
                activeTrackColor: Colors.orangeAccent,
                activeColor: Colors.green,
              ),
            ],
          ),
          SizedBox(height: 25),
          _uiWidget(),
        ],
      ),
    );
  }

  Widget _uiWidget() {
    return new Form(
        key: globalKey,
        child: Expanded(
          child: SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextFormField(
                        cursorColor: Colors.red,
                        // controller: busEditingController,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please Enter Bus Number";
                          }
                          return null;
                        },
                        onSaved: (onSavedVal) {
                          this.busDetail.busNumber = onSavedVal;
                        },
                        initialValue: busDetail.busNumber ?? "",
                        // onChanged: (value) {
                        //   busEditingController.text = value;

                        //   print(busEditingController.text);
                        // },
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16),
                        decoration: InputDecoration(
                          labelText: "Bus Number",
                          labelStyle: TextStyle(
                              color: kAccentColor,
                              fontWeight: FontWeight.normal),
                          isDense: true,
                          prefixIcon: Padding(
                            padding:
                                EdgeInsets.only(left: 10, right: 3, bottom: 3),
                            child: Icon(
                              Icons.directions_bus_rounded,
                              size: 25,
                              color: Theme.of(context).brightness ==
                                      Brightness.light
                                  ? Colors.black26
                                  : Colors.white24,
                            ),
                          ),
                          hintText: "Enter Bus Number",
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontFamily: "OpenSans",
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? Colors.black26
                                    : Colors.white24,
                          ),
                          border: OutlineInputBorder(),
                          prefixIconConstraints:
                              BoxConstraints(minWidth: 0, minHeight: 0),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide:
                                BorderSide(color: Colors.red, width: 2.0),
                          ),
                        ),
                      ),
                      _stopsContainer(),
                      Center(
                        child: FormHelper.submitButton("Update", () {
                          if (validateAndSave()) {
                            print(busDetail.toJson());
                          }
                        }),
                      )
                    ])),
          ),
        ));
  }

  Widget _stopsContainer() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Add Stop",
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ListView.separated(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            itemBuilder: (context, index) {
              return Column(
                children: [stopsUI(index)],
              );
            },
            separatorBuilder: (context, index) => const Divider(),
            itemCount: busDetail.busStops!.length),
      ],
    );
  }

  Widget stopsUI(index) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Flexible(
            child: TypeAheadFormField(
              suggestionsCallback: (pattern) async {
                // _BusDetailsState.friendsList[widget.index] = pattern;

                if (pattern.length > 0) {
                  var result = await googlePlace.autocomplete.get(pattern);
                  if (result != null && result.predictions != null && mounted) {
                    if (result.predictions!.length == 0) {
                      return Iterable<String>.empty();
                    }
                    List<String> l = [];
                    for (var element in result.predictions!) {
                      l.add(element.description!);
                    }
                    return l;
                  }
                  return Iterable<String>.empty();
                }

                return Iterable<String>.empty();
              },
              getImmediateSuggestions: true,
              hideSuggestionsOnKeyboardHide: false,
              hideOnEmpty: false,
              noItemsFoundBuilder: (context) => Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("No Location found!"),
              ),
              itemBuilder: (BuildContext context, String itemData) => ListTile(
                title: Text(itemData),
              ),
              onSuggestionSelected: (String val) {
                // this._placeController = new TextEditingController();
                this._placeController.text = val.toString();
                this.busDetail.busStops![index] = val.toString();
                print(this.busDetail);
              },
              // onSaved: (value) {
              //   this._selectedLocation = value!;
              //   print("Value =====> " + value);
              // },
              textFieldConfiguration: TextFieldConfiguration(
                  controller: this._placeController,
                  textInputAction: TextInputAction.done,
                  focusNode: startFocusNode,
                  cursorColor: Colors.red,
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                  decoration: InputDecoration(
                    labelText: "Bus Stops",
                    labelStyle: TextStyle(
                        color: kAccentColor, fontWeight: FontWeight.normal),
                    isDense: true,
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 10, right: 3, bottom: 3),
                      child: Icon(
                        Icons.location_on,
                        size: 25,
                        color: Theme.of(context).brightness == Brightness.light
                            ? Colors.black26
                            : Colors.white24,
                      ),
                    ),
                    hintText: "Add New Stop",
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontFamily: "OpenSans",
                      color: Theme.of(context).brightness == Brightness.light
                          ? Colors.black26
                          : Colors.white24,
                    ),
                    border: OutlineInputBorder(),
                    prefixIconConstraints:
                        BoxConstraints(minWidth: 0, minHeight: 0),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(color: Colors.red, width: 2.0),
                    ),
                  )),
            ),
          ),
          Visibility(
            child: SizedBox(
              width: 35,
              child: IconButton(
                icon: Icon(
                  Icons.add_circle,
                  color: Colors.green,
                ),
                onPressed: () {
                  addStopsControl();
                },
              ),
            ),
            visible: index == busDetail.busStops!.length - 1,
          ),
          Visibility(
            child: SizedBox(
              width: 35,
              child: IconButton(
                icon: Icon(
                  Icons.remove_circle,
                  color: Colors.redAccent,
                ),
                onPressed: () {
                  removeStopsControl(index);
                },
              ),
            ),
            visible: index > 0,
          ),
        ],
      ),
    );
  }

  void addStopsControl() {
    setState(() {
      busDetail.busStops!.add("");
    });
  }

  void removeStopsControl(index) {
    setState(() {
      if (busDetail.busStops!.length > 1) {
        busDetail.busStops!.removeAt(index);
      }
    });
  }

  bool validateAndSave() {
    final form = globalKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }
}



/*

TextFormField(
              cursorColor: Colors.red,
              // controller: busEditingController,
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Stop ${index + 1} can't be empty";
                }
                return null;
              },
              onSaved: (onSavedVal) {
                this.busDetail.busStops![index] = onSavedVal!;
              },
              initialValue: busDetail.busNumber ?? "",
              // onChanged: (value) {
              //   busEditingController.text = value;

              //   print(busEditingController.text);
              // },
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
              decoration: InputDecoration(
                labelText: "Bus Stop",
                labelStyle: TextStyle(
                    color: kAccentColor, fontWeight: FontWeight.normal),
                isDense: true,
                prefixIcon: Padding(
                  padding: EdgeInsets.only(left: 10, right: 3, bottom: 3),
                  child: Icon(
                    Icons.directions_bus_rounded,
                    size: 25,
                    color: Theme.of(context).brightness == Brightness.light
                        ? Colors.black26
                        : Colors.white24,
                  ),
                ),
                hintText: "Add Bus Stop",
                hintStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontFamily: "OpenSans",
                  color: Theme.of(context).brightness == Brightness.light
                      ? Colors.black26
                      : Colors.white24,
                ),
                border: OutlineInputBorder(),
                prefixIconConstraints:
                    BoxConstraints(minWidth: 0, minHeight: 0),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(color: Colors.red, width: 2.0),
                ),
              ),
            ),
*/