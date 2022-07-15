import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sanchari/constants.dart';

class FeedBack extends StatefulWidget {
  const FeedBack({Key? key}) : super(key: key);                                                                                                                                                                           

  @override
  State<FeedBack> createState() => _FeedBackState();
}

class _FeedBackState extends State<FeedBack> {
  final TextEditingController _controller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();

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
          title: Text('Feedback'),
          backgroundColor: const Color(0xffE3002C),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AlertDialog(
                title: Center(
                  child: Text(
                    "Feedback",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ),
                content: Form(
                  key: _formKey,
                  child: TextFormField(
                    controller: _controller,
                    keyboardType: TextInputType.multiline,
                    decoration: const InputDecoration(
                      hintText:
                          "Have Feedback? We'd love to hear it, but please don't share sensitive information.",
                      filled: true,
                    ),
                    maxLines: 7,
                    maxLength: 4096,
                    textInputAction: TextInputAction.done,
                    validator: (String? text) {
                      if (text == null || text.isEmpty) {
                        return "Please Enter your feedback";
                      }
                      return null;
                    },
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
                               .collection("Feedback");

                            await collection.doc().set({
                              'Timestamp': FieldValue.serverTimestamp(),
                              'Feedback': _controller.text,
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
