import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PasswordReset extends StatefulWidget {
  const PasswordReset({Key? key}) : super(key: key);

  @override
  State<PasswordReset> createState() => _PasswordResetState();
}

class _PasswordResetState extends State<PasswordReset> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _oldPasscontroller = TextEditingController();
  final TextEditingController _newPasscontroller = TextEditingController();
  final TextEditingController _confirmNewPasscontroller =
      TextEditingController();

  @override
  void dispose() {
    _oldPasscontroller.dispose();
    _newPasscontroller.dispose();
    _confirmNewPasscontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Password Reset'),
          backgroundColor: const Color(0xffE3002C),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: Text(
                "Reset your Password",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(30),
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/auth/resetPassword.jpg"))),
                ),
              ),
            ),
            AlertDialog(
                content: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: _oldPasscontroller,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          hintText: "Enter Old Password",
                          filled: true,
                        ),
                        textInputAction: TextInputAction.done,
                        validator: (String? text) {
                          if (text == null || text.isEmpty) {
                            return "Please Enter Old Password!";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      TextFormField(
                        controller: _newPasscontroller,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          hintText: "Enter New Password",
                          filled: true,
                        ),
                        textInputAction: TextInputAction.done,
                        validator: (String? text) {
                          if (text == null || text.isEmpty) {
                            return "Please Enter New Password!";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        controller: _confirmNewPasscontroller,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          hintText: "Confirm New Password",
                          filled: true,
                        ),
                        textInputAction: TextInputAction.done,
                        validator: (String? text) {
                          if (text == null || text.isEmpty) {
                            return "Please Confirm New Password!";
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16))),
                actions: [
                  TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Cancel')),
                  TextButton(
                      onPressed: () async {
                        // firebase code here
                        if (_formKey.currentState!.validate()) {
                          String message;

                          try {
                            final collection = FirebaseFirestore.instance
                                .collection("resetpass");

                            await collection.doc().set({
                              'Timestamp': FieldValue.serverTimestamp(),
                              'Feedback': _oldPasscontroller.text,
                            });

                            message = "Feedback Sent Successfully!";
                          } catch (_) {
                            message = "Error while sending feedback!";
                          }

                          ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(content: Text(message)));
                          Navigator.pop(context);
                        }
                      },
                      child: Text("Submit"))
                ]),
          ],
        ));
  }
}
