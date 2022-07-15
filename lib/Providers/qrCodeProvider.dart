import 'package:flutter/material.dart';

class QrcodeProvider with ChangeNotifier {
  String _myList = "";

  String getList() => _myList;
  void changeContent(String myStops) {
    _myList = myStops;
    notifyListeners();
  }
}
