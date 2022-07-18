import 'package:flutter/material.dart';
import 'package:sanchari/constants.dart';

class name extends StatelessWidget {
  const name({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
    )
  }
}
