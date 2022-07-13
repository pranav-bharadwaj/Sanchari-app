import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

class AuthState with ChangeNotifier {
  bool _isAuth = false;

  bool get isLoggedIn => _isAuth;

  void changeTheme() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        _isAuth = false;
      } else {
        _isAuth = true;
      }
    });
    notifyListeners();
  }
}
