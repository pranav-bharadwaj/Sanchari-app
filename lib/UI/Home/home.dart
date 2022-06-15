import "package:flutter/material.dart";
import 'package:sanchari/UI/locationSearch.dart';
import 'package:sanchari/constants.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        SizedBox(
          height: 30,
        ),
        Card(
          child: TextField(
            autofocus: false,
            style: TextStyle(fontSize: 18),
            decoration: InputDecoration(
                hintText: "Bus Number",
                hintStyle:
                    const TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
                filled: true,
                fillColor: Theme.of(context).brightness == Brightness.light
                    ? kLightPrimaryColor
                    : kDarkSecondaryColor,
                border: InputBorder.none),
          ),
          elevation: 5,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: Colors.blue, // background
              onPrimary: kLightPrimaryColor,
              elevation: 5 // foreground
              ),
          onPressed: () => {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const LocationSearch())),
          },
          child: Text('Search Destination'),
        ),
      ],
    ));
  }
}
