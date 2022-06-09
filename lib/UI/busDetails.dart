import "package:flutter/material.dart";
class BusDetails extends StatefulWidget {
  const BusDetails({Key? key}) : super(key: key);

  @override
  State<BusDetails> createState() => _BusDetailsState();
}

class _BusDetailsState extends State<BusDetails> {
  @override
  Widget build(BuildContext context) {
    return 
      Scaffold(
      appBar: AppBar(
        title: Text('Bus Details'),
        backgroundColor: const Color(0xffE3002C),
      ),
    );
  }
}