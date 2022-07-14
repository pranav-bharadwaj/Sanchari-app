import "package:flutter/material.dart";
import 'package:sanchari/constants.dart';

class BusDetails extends StatefulWidget {
  const BusDetails({Key? key}) : super(key: key);

  @override
  State<BusDetails> createState() => _BusDetailsState();
}

class _BusDetailsState extends State<BusDetails> {
  bool isSwitched = false;
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
                        SizedBox(height: 25),
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
                            labelText: "From Station",
                            labelStyle: TextStyle(
                                color: kAccentColor,
                                fontWeight: FontWeight.normal),
                            isDense: true,
                            prefixIcon: Padding(
                              padding: EdgeInsets.only(
                                  left: 10, right: 3, bottom: 3),
                              child: Icon(
                                Icons.bus_alert,
                                size: 25,
                                color: Theme.of(context).brightness ==
                                        Brightness.light
                                    ? Colors.black26
                                    : Colors.white24,
                              ),
                            ),
                            hintText: "Enter Starting station",
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
                          height: 25,
                        ),
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
                            labelText: "To Station",
                            labelStyle: TextStyle(
                                color: kAccentColor,
                                fontWeight: FontWeight.normal),
                            isDense: true,
                            prefixIcon: Padding(
                              padding: EdgeInsets.only(
                                  left: 10, right: 3, bottom: 3),
                              child: Icon(
                                Icons.gps_fixed,
                                size: 25,
                                color: Theme.of(context).brightness ==
                                        Brightness.light
                                    ? Colors.black26
                                    : Colors.white24,
                              ),
                            ),
                            hintText: "Enter Bus Destination",
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
                          height: 25,
                        ),
                        Container(
                          width: screenWidth,
                          child: ElevatedButton(
                            onPressed: () {
                              // Respond to button press
                            },
                            child: Text('Update Bus Details'),
                          ),
                        )
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
