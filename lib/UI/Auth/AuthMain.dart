import 'dart:ui';

import 'package:flutter/material.dart';

class AuthMain extends StatefulWidget {
  @override
  State<AuthMain> createState() => _AuthMainState();
}

class _AuthMainState extends State<AuthMain> {
  bool isMenuOpened = false;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    child: Container(
                      width: double.infinity,
                      height: 260.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/auth/bus-track1.png"),
                            fit: BoxFit.fill,
                            colorFilter:
                                ColorFilter.mode(Colors.red, BlendMode.hue)),
                      ),
                    ),
                  ),
                  Container(
                    constraints: BoxConstraints.tightForFinite(
                      width: screenWidth * 0.9,
                    ),
                    child: Column(
                      children: [
                        Positioned(
                          child: Container(
                            width: screenWidth * 0.6,
                            margin: EdgeInsets.only(top: 25),
                            alignment: Alignment.center,
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: '#Connecting',
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'OpenSans'),
                                  ),
                                  TextSpan(
                                    text: ' People with the Bus',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'OpenSans'),
                                  ),
                                  TextSpan(
                                    text: ' Location',
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: Divider(
                              thickness: 1,
                            )),
                            Container(
                              margin: EdgeInsets.only(left: 10, right: 10),
                              child: Text(
                                "Log in or sign up",
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontFamily: "OpenSans",
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Expanded(
                                child: Divider(
                              thickness: 1,
                            ))
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                                height: 55,
                                width: 70,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black12),
                                    borderRadius: BorderRadius.circular(5)),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        "assets/auth/flag.png",
                                        width: 22,
                                        height: 22,
                                        semanticLabel: "INDIA",
                                      ),
                                      Icon(
                                        Icons.arrow_drop_down_outlined,
                                        color: Colors.black45,
                                      )
                                    ])),
                            SizedBox(
                              width: 15,
                            ),
                            Container(
                              height: 55,
                              width: screenWidth * 0.68,
                              child: TextFormField(
                                initialValue: '',
                                cursorColor: Colors.red,
                                keyboardType: TextInputType.number,
                                style: TextStyle(
                                    fontFamily: "Open Sans",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16),
                                decoration: InputDecoration(
                                  isDense: true,
                                  prefixIcon: Padding(
                                      padding: EdgeInsets.only(
                                          left: 10, right: 3, bottom: 3),
                                      child: Text(
                                        '+91',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                          fontFamily: "OpenSans",
                                        ),
                                      )),
                                  hintText: "Enter mobile number",
                                  hintStyle: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "OpenSans",
                                      color: Colors.black26),
                                  prefixStyle: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    fontFamily: "OpenSans",
                                  ),
                                  border: OutlineInputBorder(),
                                  prefixIconConstraints:
                                      BoxConstraints(minWidth: 0, minHeight: 0),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    borderSide: BorderSide(
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          width: screenWidth,
                          height: 45,
                          child: ElevatedButton(
                            onPressed: () {
                              // Respond to button press
                            },
                            style:
                                ElevatedButton.styleFrom(primary: Colors.red),
                            child: Text(
                              "Continue",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Open Sans",
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: Divider(
                              thickness: 1,
                            )),
                            Container(
                                margin: EdgeInsets.only(left: 10, right: 10),
                                child: Text(
                                  "or",
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontFamily: "OpenSans",
                                      fontWeight: FontWeight.bold),
                                )),
                            Expanded(
                                child: Divider(
                              thickness: 1,
                            ))
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/auth/google.jgp-removebg-preview.png",
                              width: 80,
                              height: 60,
                            ),
                            Container(
                              height: 40,
                              width: 40,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  border: Border.all(
                                      width: 1, color: Colors.black26)),
                              child: IconButton(
                                iconSize: 20,
                                icon: Icon(
                                  Icons.more_horiz,
                                ),
                                onPressed: () {
                                  this.setState(() {
                                    isMenuOpened = true;
                                  });
                                },
                                splashColor: Colors.black12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // Menu drawer
                ],
              ),
            ),
            Visibility(
              visible: isMenuOpened,
              child: AnimatedOpacity(
                duration: Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                opacity: (isMenuOpened) ? 1.0 : 0.0,
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                  child: Container(
                    color: Colors.black.withOpacity(0.2),
                  ),
                ),
              ),
            ),
            AnimatedPositioned(
              curve: Curves.easeInOut,
              duration: Duration(milliseconds: 400),
              bottom: (isMenuOpened) ? -20 : -(screenHeight / 4),
              left: 0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  width: screenWidth,
                  height: screenHeight / 4,
                  color: Colors.white,
                  child: Column(
                    children: [
                      IconButton(
                        onPressed: () {
                          this.setState(() {
                            isMenuOpened = false;
                          });
                        },
                        icon: Icon(Icons.keyboard_arrow_down_sharp),
                        iconSize: 30,
                      ),
                      OutlinedButton.icon(
                        onPressed: () {
                          // Respond to button press
                        },
                        style: ElevatedButton.styleFrom(primary: Colors.white),
                        icon: Icon(Icons.facebook),
                        label: Text(
                          "Continue With Facebook",
                          style: TextStyle(
                              color: Colors.black54,
                              fontFamily: "Open Sans",
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      OutlinedButton.icon(
                        onPressed: () {
                          // Respond to button press
                        },
                        style: ElevatedButton.styleFrom(primary: Colors.white),
                        icon: Icon(Icons.email_outlined),
                        label: Text(
                          "Continue with Email account",
                          style: TextStyle(
                              color: Colors.black54,
                              fontFamily: "Open Sans",
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
