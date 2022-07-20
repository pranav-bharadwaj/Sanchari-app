import 'package:flutter/material.dart';
import 'package:sanchari/UI/GoogleMap/googleMapScreen.dart';
import 'package:sanchari/UI/GoogleMap/updateBusDetails.dart';
import 'package:sanchari/constants.dart';

class Bookmark extends StatefulWidget {
  const Bookmark({Key? key}) : super(key: key);

  @override
  State<Bookmark> createState() => _BookmarkState();
}

class _BookmarkState extends State<Bookmark> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).brightness == Brightness.light
            ? kLightSecondaryColor
            : kDarkPrimaryColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 25,
            ),
            Center(
              child: Text(
                "Bookmarks",
                style: TextStyle(fontSize: 30),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 30,
                  itemBuilder: (context, index) {
                    return Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(7))),
                      child: ListTile(
                        leading: Container(
                          height: double.infinity,
                          child: Icon(
                            Icons.directions_bus_rounded,
                            size: 40.0,
                          ),
                        ),
                        title: Text("KA - 13 F-3456"),
                        subtitle: Text("Hassan - Sakleshpur"),
                        trailing: Wrap(
                          spacing: 12, // space between two icons
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            GoogleMapScreen()));
                              },
                              child: Icon(
                                Icons.directions,
                                color: Colors.blue,
                                size: 35,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                // code to add bookmark to firebase
                                Navigator.push(context, MaterialPageRoute(builder: ((context) => UpdateBusDetails())));
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(
                                            "Bookmark removed Successfully!")));
                              },
                              child: Icon(
                                Icons.bookmark_remove_outlined,
                                color: Colors.blue,
                                size: 35,
                              ),
                            ), // icon-1
                          ],
                        ),
                      ),
                      elevation: 10,
                      margin: EdgeInsets.fromLTRB(20, 8, 20, 8),
                    );
                  }),
            )
          ],
        ));
  }
}
