import 'package:flutter/material.dart';
class PasswordReset extends StatefulWidget {
  const PasswordReset({ Key? key }) : super(key: key);

  @override
  State<PasswordReset> createState() => _PasswordResetState();
}

class _PasswordResetState extends State<PasswordReset> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Password Reset'),
        backgroundColor: const Color(0xffE3002C),
      ),
    );
      
    
  }
}