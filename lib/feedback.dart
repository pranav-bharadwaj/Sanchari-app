import 'package:flutter/material.dart';

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
        appBar: AppBar(
          title: Text('Feedback'),
          backgroundColor: const Color(0xffE3002C),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Feedback", style: TextStyle(color: Color(0xFF212121), fontWeight: FontWeight.bold, fontSize: 30),),
            AlertDialog(
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
                actions: [
                  TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Cancel')),
                  TextButton(
                      onPressed: () async {
                        // firebase code here
                      },
                      child: Text("Send"))
                ]),
          ],
        ));
  }
}
