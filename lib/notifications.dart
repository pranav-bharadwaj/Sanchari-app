// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:sanchari/constants.dart';
import 'package:sanchari/locationSearch.dart';

class Notifications extends StatelessWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> notifications =
        List<String>.generate(50, (i) => "Notification : $i");

    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.light ? kLightSecondaryColor : kDarkPrimaryColor,
      body: ListView.builder(
          itemCount: notifications.length,
          itemBuilder: (context, index) {
            return GestureDetector(
                onTap: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LocationSearch()),
                      )
                    },
                child: Card(
                  child: ListTile(
                    title: Text('${notifications[index]}'),
                  ),
                  // color: Colors.white,
                  elevation: 8,
                  margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                ));
          }),
    );
  }
}
