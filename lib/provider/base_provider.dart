import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class BaseProvider extends ChangeNotifier {
  bool isAndroid = true;
  bool isDart = false;
  ConnectivityResult connectivityResult = ConnectivityResult.none;

  Stream<ConnectivityResult>? stream;

  void changePlatform() {
    isAndroid = !isAndroid;
    notifyListeners();
  }

  void changeThemeMode() {
    isDart = !isDart;
    notifyListeners();
  }

  void checkInternet() {
    Connectivity().checkConnectivity().then((value) {
      print(" checkInternet $value");
    });
  }

  void internetListener() {

    stream= Connectivity().onConnectivityChanged;
    Connectivity().onConnectivityChanged.listen((event) {
      connectivityResult = event;
      notifyListeners();
    });
  }
}
