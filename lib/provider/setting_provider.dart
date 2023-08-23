import 'package:flutter/material.dart';
import 'package:platfrom_converter/main.dart';
import 'package:platfrom_converter/util/constant.dart';

class SettingProvider extends ChangeNotifier {
  bool isProfile = preferences.getBool(enableProfile) ?? false;
  String profilePathText = "";

  String nameText = "";
  String bioText = "";

  void changeProfileSwitch(bool isEnable) {
    isProfile = isEnable;
    preferences.setBool(enableProfile, isEnable);
    notifyListeners();
  }

  void saveProfileData(bool isSave) {
    preferences.setString(profilePath, isSave ? profilePathText : "");
    preferences.setString(name, isSave ? nameText : "");
    preferences.setString(bio, isSave ? bioText : "");
  }
}
