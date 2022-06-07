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
        backgroundColor: Theme.of(context).brightness == Brightness.light
            ? kLightSecondaryColor
            : kDarkPrimaryColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 25,),
            Text("Notifications", style: TextStyle(fontSize: 30),),
            SizedBox(height: 5,),
            Expanded(
              child: ListView.builder(
                  itemCount: notifications.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        leading: Container(
                          height: double.infinity,
                          child: Icon(
                            Icons.message,
                            size: 40.0,
                            color: Colors.blue,
                          ),
                        ),
                        title: Padding(
                          padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
                          child: Text(
                            '${notifications[index]}',
                            style: TextStyle(color: kDarkPrimaryColor),
                          ),
                        ),
                        subtitle: Padding(
                          padding: EdgeInsets.fromLTRB(0.0, 0.0, 5.0, 5.0),
                          child: Text(
                            "A card is a sheet used to represent the information related to each other, such as an album",
                            style: TextStyle(color: kDarkSecondaryColor),
                          ),
                        ),
                        onTap: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LocationSearch()),
                          )
                        },
                      ),
                      // color: Colors.white,
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      margin: EdgeInsets.fromLTRB(20, 10, 20, 8),
                    );
                  }),
            )
          ],
        ));
  }
}
