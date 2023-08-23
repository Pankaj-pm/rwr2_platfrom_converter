import 'package:flutter/material.dart';

class BaseProvider extends ChangeNotifier {
  bool isAndroid = true;
  bool isDart = false;

  void changePlatform() {
    isAndroid = !isAndroid;
    notifyListeners();
  }

  void changeThemeMode() {
    isDart = !isDart;
    notifyListeners();
  }
}
