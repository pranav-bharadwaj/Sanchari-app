import 'package:flutter/material.dart';
import 'package:touch_ripple_effect/touch_ripple_effect.dart';

class AuthMain extends StatelessWidget {
  const AuthMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                child: Container(
                  width: double.infinity,
                  height: 300.0,
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
                                crossAxisAlignment: CrossAxisAlignment.center,
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
                        style: ElevatedButton.styleFrom(primary: Colors.red),
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
                              border:
                                  Border.all(width: 1, color: Colors.black26)),
                          child: TouchRippleEffect(
                            borderRadius: BorderRadius.circular(50),
                            child: IconButton(
                              iconSize: 20,
                              icon: Icon(
                                Icons.more_horiz,
                              ),
                              onPressed: () {},
                              splashColor: Colors.black12,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
