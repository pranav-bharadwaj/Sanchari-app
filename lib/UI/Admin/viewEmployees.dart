import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:sanchari/constants.dart';

class ViewEmployees extends StatefulWidget {
  const ViewEmployees({Key? key}) : super(key: key);

  @override
  State<ViewEmployees> createState() => _ViewEmployeesState();
}

class _ViewEmployeesState extends State<ViewEmployees> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("HI Employees"),
      ),
    );
  }
}
