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
        backgroundColor: Theme.of(context).brightness == Brightness.light
            ? kLightSecondaryColor
            : kDarkPrimaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                height: 60,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LocationSearch()));
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(60),
                    ),
                    child: TextField(
                      enabled: false,
                      autofocus: false,
                      style: TextStyle(fontSize: 20),
                      decoration: InputDecoration(
                        hintText: "Search bus by destination",
                        hintStyle: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                        ),
                        contentPadding: EdgeInsets.fromLTRB(20, 30, 10, 0),
                        filled: true,
                        fillColor:
                            Theme.of(context).brightness == Brightness.light
                                ? kLightPrimaryColor
                                : kDarkSecondaryColor,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(60),
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        suffixIcon: IconButton(
                            onPressed: () {}, icon: Icon(Icons.search)),
                      ),
                    ),
                    color: Colors.white,
                    // shadowColor: Colors.red,
                    elevation: 5,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
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
          ),
        ));
  }
}
