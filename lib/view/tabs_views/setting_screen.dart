// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platfrom_converter/main.dart';
import 'package:platfrom_converter/provider/base_provider.dart';
import 'package:platfrom_converter/provider/setting_provider.dart';
import 'package:platfrom_converter/util/constant.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  int val = 0;
  GlobalKey<FormState> key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Provider.of<BaseProvider>(context).isAndroid
        ? Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Consumer<SettingProvider>(
                    builder: (context, settingProvider, child) => Form(
                      key: key,
                      child: Column(
                        children: [
                          ListTile(
                            leading: Icon(Icons.person),
                            title: Text("Profile"),
                            subtitle: Text("Update Profile Data"),
                            trailing: Switch(
                                onChanged: (value) {
                                  settingProvider.changeProfileSwitch(value);
                                },
                                value: settingProvider.isProfile),
                          ),
                          if (settingProvider.isProfile) ...[
                            CircleAvatar(
                              radius: 60,
                              child: Icon(Icons.camera_alt_outlined),
                            ),
                            TextFormField(
                              initialValue: preferences.getString(name),
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                hintText: "Enter You name...",
                                border: InputBorder.none,
                              ),
                              onSaved: (newValue) {
                                settingProvider.nameText = newValue ?? "";
                              },
                              validator: (value) {
                                if (value?.isEmpty ?? false) {
                                  return "Enter Your Name";
                                }
                                return null;
                              },
                            ),
                            TextFormField(
                              initialValue: preferences.getString(bio),
                              decoration: InputDecoration(
                                hintText: "Enter You Bio...",
                                border: InputBorder.none,
                              ),
                              onSaved: (newValue) {
                                settingProvider.bioText = newValue ?? "";
                              },
                              validator: (value) {
                                if (value?.isEmpty ?? false) {
                                  return "Enter Bio";
                                }
                                return null;
                              },
                              textAlign: TextAlign.center,
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextButton(
                                    onPressed: () {
                                      if (key.currentState?.validate() ?? false) {
                                        key.currentState?.save();
                                        settingProvider.saveProfileData(true);
                                      }
                                    },
                                    child: Text("Save".toUpperCase())),
                                TextButton(
                                    onPressed: () {
                                      settingProvider.saveProfileData(false);
                                    },
                                    child: Text("Clear".toUpperCase())),
                              ],
                            )
                          ],
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    indent: 15,
                    endIndent: 15,
                  ),
                  Consumer<BaseProvider>(
                    builder: (context, baseProvider, child) => ListTile(
                      leading: Icon(Icons.light_mode_outlined),
                      title: Text("Theme"),
                      subtitle: Text("Update theme"),
                      trailing: Switch(
                          onChanged: (value) {
                            baseProvider.changeThemeMode();
                          },
                          value: baseProvider.isDart),
                    ),
                  ),
                  // CupertinoSlider(
                  //   value: slideValue,
                  //   onChanged: (value) {
                  //     slideValue = value;
                  //     setState(() {});
                  //   },
                  // ),
                  CupertinoSegmentedControl(
                    children: {
                      0: Text("One"),
                      1: Text("Two"),
                      2: Text("Two"),
                      3: Text("Two"),
                    },
                    borderColor: Colors.blue,
                    pressedColor: Colors.yellow,
                    selectedColor: Colors.black,
                    unselectedColor: Colors.blue,
                    groupValue: val,
                    onValueChanged: (value) {
                      val = value;
                      setState(() {});
                      print(value);
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CupertinoSlidingSegmentedControl(
                    children: {
                      0: Text("One"),
                      1: Text("Two"),
                      2: Text("Two"),
                      3: Text("Two"),
                    },
                    // thumbColor: Colors.red,
                    padding: EdgeInsetsDirectional.all(5),
                    // backgroundColor: Colors.grey,
                    groupValue: val,
                    onValueChanged: (value) {
                      val = value ?? 0;
                      setState(() {});
                      print(value);
                    },
                  )
                ],
              ),
            ),
          )
        : CupertinoPageScaffold(
            child: SafeArea(
              child: CupertinoListSection(
                children: [
                  Consumer<SettingProvider>(
                    builder: (context, settingProvider, child) => Form(
                      key: key,
                      child: Column(
                        children: [
                          CupertinoListTile(
                            leading: Icon(Icons.person),
                            title: Text("Profile"),
                            subtitle: Text("Update Profile Data"),
                            trailing: CupertinoSwitch(
                                onChanged: (value) {
                                  settingProvider.changeProfileSwitch(value);
                                },
                                value: settingProvider.isProfile),
                          ),
                          if (settingProvider.isProfile) ...[
                            CircleAvatar(
                              radius: 60,
                              child: Icon(Icons.camera_alt_outlined),
                            ),
                            CupertinoTextFormFieldRow(
                              initialValue: preferences.getString(name),
                              textAlign: TextAlign.center,
                              // decoration: InputDecoration(
                              //   hintText: "Enter You name...",
                              //   border: InputBorder.none,
                              // ),
                              placeholder:"Enter You name...",
                              onSaved: (newValue) {
                                settingProvider.nameText = newValue ?? "";
                              },
                              validator: (value) {
                                if (value?.isEmpty ?? false) {
                                  return "Enter Your Name";
                                }
                                return null;
                              },
                            ),
                            CupertinoTextFormFieldRow(
                              initialValue: preferences.getString(bio),
                              // decoration: InputDecoration(
                              //   hintText: "Enter You Bio...",
                              //   border: InputBorder.none,
                              // ),
                              placeholder: "Enter You Bio...",
                              onSaved: (newValue) {
                                settingProvider.bioText = newValue ?? "";
                              },
                              validator: (value) {
                                if (value?.isEmpty ?? false) {
                                  return "Enter Bio";
                                }
                                return null;
                              },
                              textAlign: TextAlign.center,
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextButton(
                                    onPressed: () {
                                      if (key.currentState?.validate() ?? false) {
                                        key.currentState?.save();
                                        settingProvider.saveProfileData(true);
                                      }
                                    },
                                    child: Text("Save".toUpperCase())),
                                TextButton(
                                    onPressed: () {
                                      settingProvider.saveProfileData(false);
                                    },
                                    child: Text("Clear".toUpperCase())),
                              ],
                            )
                          ],
                        ],
                      ),
                    ),
                  ),
                  Consumer<BaseProvider>(
                    builder: (context, baseProvider, child) => CupertinoListTile(
                      leading: Icon(Icons.light_mode_outlined),
                      title: Text("Theme"),
                      subtitle: Text("Update theme"),
                      trailing: CupertinoSwitch(
                          onChanged: (value) {
                            baseProvider.changeThemeMode();
                          },
                          value: baseProvider.isDart),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
