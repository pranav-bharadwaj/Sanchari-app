import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sanchari/constants.dart';

class AddNotifications extends StatefulWidget {
  const AddNotifications({Key? key}) : super(key: key);

  @override
  State<AddNotifications> createState() => _AddNotificationsState();
}

class _AddNotificationsState extends State<AddNotifications> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _titleController = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).brightness == Brightness.light
            ? kLightSecondaryColor
            : kDarkPrimaryColor,
        appBar: AppBar(
          title: Text('Notifications'),
          backgroundColor: const Color(0xffE3002C),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AlertDialog(
                title: Center(
                  child: Text(
                    "Add Notifications",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ),
                content: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _titleController,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          hintText: "Title",
                          filled: true,
                        ),
                        textInputAction: TextInputAction.done,
                        validator: (String? text) {
                          if (text == null || text.isEmpty) {
                            return "Please Enter Notification Title!";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        controller: _controller,
                        keyboardType: TextInputType.multiline,
                        decoration: const InputDecoration(
                          hintText: "Enter notification message.",
                          filled: true,
                        ),
                        maxLines: 5,
                        maxLength: 4096,
                        textInputAction: TextInputAction.done,
                        validator: (String? text) {
                          if (text == null || text.isEmpty) {
                            return "Please Enter notification message!";
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
                                .collection("Notifications");

                            await collection.doc().set({
                              'Timestamp': FieldValue.serverTimestamp(),
                              'Title': _titleController.text,
                              'Message': _controller.text,
                            });

                            message = "Notification added Successfully!";
                          } catch (_) {
                            message = "Error while adding Notification!";
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
