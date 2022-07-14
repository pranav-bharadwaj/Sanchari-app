import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sanchari/constants.dart';

class AddEmployee extends StatefulWidget {
  const AddEmployee({Key? key}) : super(key: key);

  @override
  State<AddEmployee> createState() => _AddEmployeeState();
}

class _AddEmployeeState extends State<AddEmployee> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).brightness == Brightness.light
            ? kLightSecondaryColor
            : kDarkPrimaryColor,
        appBar: AppBar(
          title: Text('Employee'),
          backgroundColor: const Color(0xffE3002C),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AlertDialog(
                title: Center(
                  child: Text(
                    "Add Employee",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ),
                content: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _controller,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          hintText: "Enter Employee Id",
                          filled: true,
                        ),
                        textInputAction: TextInputAction.done,
                        validator: (String? text) {
                          if (text == null || text.isEmpty) {
                            return "Please Enter Employee Id!";
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
                                .collection("EmployeeId");

                            await collection.doc().set({
                              'Timestamp': FieldValue.serverTimestamp(),
                              'EmployeeId': _controller.text,
                            });

                            message = "Employee added Successfully!";
                          } catch (_) {
                            message = "Error while adding Employee!";
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
