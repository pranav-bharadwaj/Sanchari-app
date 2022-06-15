import 'package:flutter/material.dart';

class PasswordReset extends StatefulWidget {
  const PasswordReset({Key? key}) : super(key: key);

  @override
  State<PasswordReset> createState() => _PasswordResetState();
}

class _PasswordResetState extends State<PasswordReset> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Password Reset'),
        backgroundColor: const Color(0xffE3002C),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              "Reset your Password",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(0),
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/auth/resetPassword.jpg"))),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              "Reset your Password",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
          ),
        ],
      ),
    );
  }
}
