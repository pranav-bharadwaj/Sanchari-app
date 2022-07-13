import "package:flutter/material.dart";
import 'package:sanchari/Models/user_model.dart';
import 'package:sanchari/UI/Auth/Login.dart';
import 'package:sanchari/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sanchari/main.dart';

class SignUp extends StatefulWidget {
  SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool value = false;
  final _auth = FirebaseAuth.instance;
  String? errorMessage;
  final _formKey = GlobalKey<FormState>();

  final nameEditingController = new TextEditingController();
  final emailEditingController = new TextEditingController();
  final passwordEditingController = new TextEditingController();
  final employeeEditingController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
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
                      text: "Create An ",
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
                "And Find Your Bus Realtime location",
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
                      TextFormField(
                        controller: nameEditingController,
                        validator: (value) {
                          RegExp regex = new RegExp(r'^.{3,}$');
                          if (value!.isEmpty) {
                            return ("Name cannot be Empty");
                          }
                          if (!regex.hasMatch(value)) {
                            return ("Enter Valid name(Min. 3 Character)");
                          }
                          return null;
                        },
                        onSaved: (value) {
                          nameEditingController.text = value!;
                        },
                        cursorColor: Colors.red,
                        keyboardType: TextInputType.text,
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16),
                        decoration: InputDecoration(
                          labelText: "Full Name",
                          labelStyle: TextStyle(
                              color: kAccentColor,
                              fontWeight: FontWeight.normal),
                          isDense: true,
                          prefixIcon: Padding(
                            padding:
                                EdgeInsets.only(left: 10, right: 3, bottom: 3),
                            child: Icon(
                              Icons.account_circle_sharp,
                              size: 25,
                              color: Theme.of(context).brightness ==
                                      Brightness.light
                                  ? Colors.black26
                                  : Colors.white24,
                            ),
                          ),
                          hintText: "Enter your full name",
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.w600,
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
                            "Create Account as Department Employee",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black45),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Visibility(
                        visible: this.value,
                        child: TextFormField(
                          controller: employeeEditingController,
                          validator: (value) {
                            if (this.value) {
                              if (employeeEditingController.text.isEmpty) {
                                return "Employee ID must be valid digits";
                              } else {
                                return null;
                              }
                            }

                            return null;
                          },
                          onSaved: (value) {
                            employeeEditingController.text = value!;
                          },
                          cursorColor: Colors.red,
                          keyboardType: TextInputType.text,
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 16),
                          decoration: InputDecoration(
                            labelText: "Employee ID",
                            labelStyle: TextStyle(
                                color: kAccentColor,
                                fontWeight: FontWeight.normal),
                            isDense: true,
                            prefixIcon: Padding(
                              padding: EdgeInsets.only(
                                  left: 10, right: 3, bottom: 3),
                              child: Icon(
                                Icons.admin_panel_settings,
                                size: 25,
                                color: Theme.of(context).brightness ==
                                        Brightness.light
                                    ? Colors.black26
                                    : Colors.white24,
                              ),
                            ),
                            hintText: "Enter Your Dept Empolyee ID",
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
                            signupVerify(
                                emailEditingController.text,
                                passwordEditingController.text,
                                employeeEditingController.text,
                                this.value);
                            print(this.value);
                          },
                          style: ElevatedButton.styleFrom(primary: Colors.red),
                          child: Text(
                            "Create My Account",
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
                            "Already have an account ",
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
                                      builder: (context) => Login()));
                            }),
                            child: Text("Login",
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

  void signupVerify(
      String email, String password, String employeeId, bool isEmpolyee) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    if (_formKey.currentState!.validate()) {
      try {
        if (isEmpolyee) {
          firebaseFirestore
              .collection("EmployeeId")
              .where("EmployeeId", isEqualTo: employeeId)
              .get()
              .then((value) async => {
                    if (value.size >= 1)
                      {
                        await _auth
                            .createUserWithEmailAndPassword(
                                email: email, password: password)
                            .then((value) =>
                                {postDetailsToFirestore(true, employeeId)})
                            .catchError((e) {
                          Fluttertoast.showToast(msg: e!.message);
                        })
                      }
                    else
                      {
                        Fluttertoast.showToast(
                            msg: "Employee is not registered..!")
                      }
                  });
        } else {
          await _auth
              .createUserWithEmailAndPassword(email: email, password: password)
              .then((value) {
            postDetailsToFirestore(false, "");
          }).catchError((e) {
            Fluttertoast.showToast(msg: e!.message);
          });
        }
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

  postDetailsToFirestore(bool isEmployee, String employeeId) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    User? user = _auth.currentUser;

    UserModel userModel = UserModel();
    userModel.uid = user!.uid;
    userModel.email = user.email;
    userModel.fullname = nameEditingController.text;
    userModel.dateofbirth = "";
    userModel.isEmployee = isEmployee;
    userModel.employeeId = employeeId;
    userModel.isAdmin = false;
    print(Timestamp.now().toString());
    userModel.registeredOn = DateTime.now().toUtc().toString();
    print("got it");
    await firebaseFirestore
        .collection("User")
        .doc(user.uid)
        .set(userModel.toMap())
        .then((value) => {
              Fluttertoast.showToast(msg: "Account created successfully :) "),
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => MyHomePage())),
            })
        .catchError((e) {
      Fluttertoast.showToast(msg: e!.message);
    });
  }
}
