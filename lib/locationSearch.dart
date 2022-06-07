import 'package:flutter/material.dart';
import 'package:google_place/google_place.dart';
import 'package:sanchari/constants.dart';

class LocationSearch extends StatefulWidget {
  const LocationSearch({Key? key}) : super(key: key);

  @override
  State<LocationSearch> createState() => _LocationSearchState();
}

class _LocationSearchState extends State<LocationSearch> {
  final _startSearchFieldController = TextEditingController();
  final _endSearchFeildController = TextEditingController();
  late GooglePlace googlePlace;
  List<AutocompletePrediction> predictions = [];
  @override
  void initState() {
    super.initState();
    String apiKey = 'AIzaSyDkUIcjT-EoDI--cqAT3Zfj_37T34tHz7c';
    googlePlace = GooglePlace(apiKey);
  }

  void autoCompleteSearch(String value) async {
    var result = await googlePlace.autocomplete.get(value);
    if (result != null && result.predictions != null && mounted) {
      print(result.predictions!.first.description);
      print("hiiiiiiii monuuuuuu");
      setState(() {});
      predictions = result.predictions!;
    } else {
      print("cool");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? kLightSecondaryColor
          : kDarkPrimaryColor,
      appBar: AppBar(
        title: Text("Search Bus"),
        backgroundColor: const Color(0xffE3002C),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Card(
              child: TextField(
                  controller: _startSearchFieldController,
                  autofocus: false,
                  style: TextStyle(fontSize: 18),
                  decoration: InputDecoration(
                      hintText: "Choose start location",
                      hintStyle: const TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 18),
                      filled: true,
                      fillColor:
                          Theme.of(context).brightness == Brightness.light
                              ? kLightPrimaryColor
                              : kDarkSecondaryColor,
                      border: InputBorder.none),
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      autoCompleteSearch(value);
                    } else {}
                  }),
              color: Colors.white,
              elevation: 5,
            ),
            SizedBox(
              height: 10,
            ),
            Card(
              child: TextField(
                controller: _endSearchFeildController,
                autofocus: false,
                style: TextStyle(fontSize: 18),
                decoration: InputDecoration(
                    hintText: "Choose destination",
                    hintStyle: const TextStyle(
                        fontWeight: FontWeight.w400, fontSize: 18),
                    filled: true,
                    fillColor: Theme.of(context).brightness == Brightness.light
                        ? kLightPrimaryColor
                        : kDarkSecondaryColor,
                    border: InputBorder.none),
              ),
              color: Colors.white,
              elevation: 5,
            )
          ],
        ),
      ),
    );
  }
}
