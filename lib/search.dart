import 'package:flutter/material.dart';
import 'package:sanchari/constants.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);
  get _busNumberController => TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kLightSecondaryColor,
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
              padding: EdgeInsets.all(20.0),
              child: Card(
                child: TextField(
                  controller: _busNumberController,
                  autofocus: false,
                  style: TextStyle(fontSize: 18),
                  decoration: InputDecoration(
                      hintText: "Bus Number",
                      hintStyle: const TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 18),
                      filled: true,
                      fillColor: Colors.white,
                      border: InputBorder.none),
                ),
                color: Colors.white,
                elevation: 5,
                shadowColor: Colors.grey,
              )),
          Expanded(
              child: ListView.builder(
                  itemCount: 30,
                  itemBuilder: (context, index) {
                    return Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: ListTile(
                        leading: Icon(
                          Icons.directions_bus_rounded,
                          size: 40.0,
                        ),
                        title: Text("KA - 13 F-3456"),
                        subtitle: Text("Hassan - Sakleshpur"),
                        trailing: IconButton(
                          onPressed: () {
                            print("hi");
                          },
                          icon: Icon(Icons.directions),
                          color: Colors.blue,
                          iconSize: 40.0,
                        ),
                      ),
                      color: Colors.white,
                      elevation: 8,
                      shadowColor: Colors.grey,
                      margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    );
                  }))
        ]));
  }
}
