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
    var screenSize = MediaQuery.maybeOf(context)!.size;
    return Scaffold(
        backgroundColor: Theme.of(context).brightness == Brightness.light
            ? kLightSecondaryColor
            : kDarkPrimaryColor,
        body: Column(
          children: [
            Container(
              height: screenSize.height * 0.23,
              child: Stack(
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                    height: 150,
                    width: screenSize.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(25.0),
                            bottomRight: Radius.circular(25.0)),
                        color: kAccentColor,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 3.0), //(x,y)
                            blurRadius: 6.0,
                          ),
                        ]),
                  ),
                  Positioned(
                    top: 20,
                    left: 20,
                    child: Text(
                      'Hello Sanchari !',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Positioned(
                    top: 55,
                    left: 20,
                    child: Text(
                      'Connecting people with journey 🤝',
                      style: TextStyle(
                          color: Colors.grey.shade100,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: screenSize.height * 0.12),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        height: 60,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const LocationSearch()));
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
                                contentPadding:
                                    EdgeInsets.fromLTRB(20, 30, 10, 0),
                                filled: true,
                                fillColor: Theme.of(context).brightness ==
                                        Brightness.light
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
                    ),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
