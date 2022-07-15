import "package:flutter/material.dart";
import 'package:sanchari/constants.dart';

class BusDetails extends StatefulWidget {
  const BusDetails({Key? key}) : super(key: key);

  @override
  State<BusDetails> createState() => _BusDetailsState();
}

class _BusDetailsState extends State<BusDetails> {
  bool isSwitched = false;
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  static List<String> friendsList = [""];

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Bus Details'),
        backgroundColor: const Color(0xffE3002C),
      ),
      body: Container(
        width: screenWidth,
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
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
                      value: isSwitched,
                      onChanged: (value) {
                        setState(() {
                          isSwitched = value;
                          print(isSwitched);
                        });
                      },
                      activeTrackColor: Colors.orangeAccent,
                      activeColor: Colors.green,
                    ),
                  ],
                ),
                SizedBox(height: 25),
                Container(
                    width: screenWidth * 0.8,
                    child: Column(
                      children: [
                        TextFormField(
                          cursorColor: Colors.red,
                          // controller: emailEditingController,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return ("Please Enter Your Email");
                            }
                            // reg expression for email validation
                            if (!RegExp(
                                    "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                .hasMatch(value)) {
                              return ("Please Enter a valid email");
                            }
                            return null;
                          },
                          onSaved: (value) {
                            // emailEditingController.text = value!;
                          },
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 16),
                          decoration: InputDecoration(
                            labelText: "Bus Number",
                            labelStyle: TextStyle(
                                color: kAccentColor,
                                fontWeight: FontWeight.normal),
                            isDense: true,
                            prefixIcon: Padding(
                              padding: EdgeInsets.only(
                                  left: 10, right: 3, bottom: 3),
                              child: Icon(
                                Icons.numbers_outlined,
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
                              color: Theme.of(context).brightness ==
                                      Brightness.light
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
                        SizedBox(
                          height: 20,
                        ),
                        ..._getFriends(),
                        SizedBox(height: 25),
                        Container(
                          width: screenWidth,
                          child: ElevatedButton(
                            onPressed: () {
                              // Respond to button press
                            },
                            child: Text('Update Bus Details'),
                          ),
                        ),
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _getFriends() {
    List<Widget> friendsTextFields = [];
    for (int i = 0; i < friendsList.length; i++) {
      friendsTextFields.add(Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Row(
          children: [
            Expanded(child: FriendTextFields(i)),
            SizedBox(
              width: 16,
            ),
            // we need add button at last friends row
            _addRemoveButton(i == friendsList.length - 1, i),
          ],
        ),
      ));
    }
    return friendsTextFields;
  }

  /// add / remove button
  Widget _addRemoveButton(bool add, int index) {
    return InkWell(
      onTap: () {
        if (add) {
          // add new text-fields at the top of all friends textfields
          friendsList.insert(0, "");
        } else
          friendsList.removeAt(index);
        setState(() {});
      },
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: (add) ? Colors.green : Colors.red,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Icon(
          (add) ? Icons.add : Icons.remove,
          color: Colors.white,
        ),
      ),
    );
  }
}

class FriendTextFields extends StatefulWidget {
  final int index;
  FriendTextFields(this.index);
  @override
  _FriendTextFieldsState createState() => _FriendTextFieldsState();
}

class _FriendTextFieldsState extends State<FriendTextFields> {
  TextEditingController _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _nameController.text = _BusDetailsState.friendsList[widget.index];
    });

    return TextFormField(
      controller: _nameController,
      onChanged: (v) => _BusDetailsState.friendsList[widget.index] = v,
      cursorColor: Colors.red,
      // controller: emailEditingController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please Enter Your Email");
        }
        // reg expression for email validation
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
          return ("Please Enter a valid email");
        }
        return null;
      },
      onSaved: (value) {
        // emailEditingController.text = value!;
      },
      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
      decoration: InputDecoration(
        labelText: "Bus Stops",
        labelStyle:
            TextStyle(color: kAccentColor, fontWeight: FontWeight.normal),
        isDense: true,
        prefixIcon: Padding(
          padding: EdgeInsets.only(left: 10, right: 3, bottom: 3),
          child: Icon(
            Icons.gps_fixed,
            size: 25,
            color: Theme.of(context).brightness == Brightness.light
                ? Colors.black26
                : Colors.white24,
          ),
        ),
        hintText: "Enter New Bus Stop",
        hintStyle: TextStyle(
          fontWeight: FontWeight.w500,
          fontFamily: "OpenSans",
          color: Theme.of(context).brightness == Brightness.light
              ? Colors.black26
              : Colors.white24,
        ),
        border: OutlineInputBorder(),
        prefixIconConstraints: BoxConstraints(minWidth: 0, minHeight: 0),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: Colors.red, width: 2.0),
        ),
      ),
    );
  }
}
