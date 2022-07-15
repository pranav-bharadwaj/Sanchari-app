import "package:flutter/material.dart";
import 'package:sanchari/UI/Auth/SignUp.dart';
import 'package:sanchari/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sanchari/main.dart';


class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _auth = FirebaseAuth.instance;
  String? errorMessage;
  final _formKey = GlobalKey<FormState>();
  bool value = false;

  final nameEditingController = new TextEditingController();
  final emailEditingController = new TextEditingController();
  final passwordEditingController = new TextEditingController();
  final employeeEditingController = new TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    
    double screenWidth = MediaQuery.of(context).size.width;
    // ignore: unused_local_variable
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).brightness == Brightness.light
            ? Colors.white
            : Colors.black,
        elevation: 0,
        leading: Container(
          margin: EdgeInsets.only(top: 20),
          child: new IconButton(
            icon: new Icon(
              Icons.arrow_back_ios_new,
              color: Theme.of(context).brightness == Brightness.light
                  ? kAccentColor
                  : Colors.white,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          
            child: Container(
          margin: EdgeInsets.only(top: 20, left: 28, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                  text: TextSpan(
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                      text: "Login with ",
                      style: TextStyle(
                        color: Theme.of(context).brightness == Brightness.light
                            ? Colors.black87
                            : Colors.white,
                      )),
                  TextSpan(
                      text: "Account",
                      style: TextStyle(
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? kAccentColor
                                  : Color.fromARGB(255, 117, 189, 248)))
                ],
              )),
              SizedBox(
                height: 10,
              ),
              Text(
                "And Feel free to search seamlessly",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).brightness == Brightness.light
                      ? Colors.black26
                      : Colors.white24,
                ),
              ),
              SizedBox(
                height: 70,
              ),
              Form(
                key: _formKey,
                child: Container(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        cursorColor: Colors.red,
                        controller: emailEditingController,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return ("Please Enter Your Email");
                          }
                          // reg expression for email validation
                          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                              .hasMatch(value)) {
                            return ("Please Enter a valid email");
                          }
                          return null;
                        },
                        onSaved: (value) {
                          emailEditingController.text = value!;
                        },
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16),
                        decoration: InputDecoration(
                          labelText: "Email address",
                          labelStyle: TextStyle(
                              color: kAccentColor,
                              fontWeight: FontWeight.normal),
                          isDense: true,
                          prefixIcon: Padding(
                            padding:
                                EdgeInsets.only(left: 10, right: 3, bottom: 3),
                            child: Icon(
                              Icons.mark_email_read,
                              size: 25,
                              color: Theme.of(context).brightness ==
                                      Brightness.light
                                  ? Colors.black26
                                  : Colors.white24,
                            ),
                          ),
                          hintText: "Enter your Email address",
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
                      SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        controller: passwordEditingController,
                        obscureText: true,
                        validator: (value) {
                          RegExp regex = new RegExp(r'^.{6,}$');
                          if (value!.isEmpty) {
                            return ("Password is required for login");
                          }
                          if (!regex.hasMatch(value)) {
                            return ("Enter Valid Password(Min. 6 Character)");
                          }
                          return null;
                        },
                        onSaved: (value) {
                          passwordEditingController.text = value!;
                        },
                        cursorColor: Colors.red,
                        keyboardType: TextInputType.text,
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16),
                        decoration: InputDecoration(
                          labelText: "Password",
                          labelStyle: TextStyle(
                              color: kAccentColor,
                              fontWeight: FontWeight.normal),
                          isDense: true,
                          prefixIcon: Padding(
                            padding:
                                EdgeInsets.only(left: 10, right: 3, bottom: 3),
                            child: Icon(
                              Icons.password_sharp,
                              size: 25,
                              color: Theme.of(context).brightness ==
                                      Brightness.light
                                  ? Colors.black26
                                  : Colors.white24,
                            ),
                          ),
                          hintText: "Enter Strong password",
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
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Checkbox(
                            value: this.value,
                            onChanged: (value) {
                              setState(() {
                                this.value = !this.value;
                              });
                            },
                          ),
                          Text(
                            "Keep me signed In",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black45),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      Container(
                        width: screenWidth,
                        height: 45,
                        child: ElevatedButton(
                          onPressed: () {
                            signIn(emailEditingController.text,
                                passwordEditingController.text);
                          },
                          
                          style: ElevatedButton.styleFrom(primary: Colors.red),
                          child: Text(
                            "Get My Account",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Open Sans",
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      //C
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account? ",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          GestureDetector(
                            onTap: (() {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUp()));
                            }),
                            child: Text("Create new one",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).brightness ==
                                            Brightness.light
                                        ? kAccentColor
                                        : Color.fromARGB(255, 117, 189, 248))),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        )),
      ),
    );
  }

  void signIn(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((uid) => {
                  Fluttertoast.showToast(msg: "Login Successful"),
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => MyHomePage())),
                });
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            errorMessage = "Your email address appears to be malformed.";

            break;
          case "wrong-password":
            errorMessage = "Your password is wrong.";
            break;
          case "user-not-found":
            errorMessage = "User with this email doesn't exist.";
            break;
          case "user-disabled":
            errorMessage = "User with this email has been disabled.";
            break;
          case "too-many-requests":
            errorMessage = "Too many requests";
            break;
          case "operation-not-allowed":
            errorMessage = "Signing in with Email and Password is not enabled.";
            break;
          default:
            errorMessage = "An undefined Error happened.";
        }
        Fluttertoast.showToast(msg: errorMessage!);
        print(error.code);
      }
    }
  }
}
