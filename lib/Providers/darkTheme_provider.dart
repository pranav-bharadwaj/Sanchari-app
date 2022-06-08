import 'package:flutter/material.dart';

class DarkTheme with ChangeNotifier {
  bool _isLightMode = true;

  bool get isLightMode => _isLightMode;

  void changeTheme(){
    _isLightMode = !_isLightMode;
    notifyListeners();
  }
}
