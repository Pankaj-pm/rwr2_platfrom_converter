// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:platfrom_converter/provider/base_provider.dart';
import 'package:platfrom_converter/view/tabs_views/add_contact_screen.dart';
import 'package:platfrom_converter/view/tabs_views/calls_screen.dart';
import 'package:platfrom_converter/view/tabs_views/chat_screen.dart';
import 'package:platfrom_converter/view/tabs_views/setting_screen.dart';
import 'dart:io';

import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  LocalAuthentication auth = LocalAuthentication();
  bool isAuthSupport = false;
  bool authenticate = false;

  List<Widget> tabsList = [
    AddContact(),
    ChatScreen(),
    CallScreen(),
    SettingScreen(),
  ];

  @override
  void initState() {
    Provider.of<BaseProvider>(context, listen: false).internetListener();
    auth.isDeviceSupported().then((value) {
      isAuthSupport = value;
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BaseProvider>(
      builder: (context, platformProvider, child) {
        if (platformProvider.isAndroid) {
          return DefaultTabController(
            length: 4,
            initialIndex: 1,
            child: Scaffold(
              appBar: AppBar(
                title: StreamBuilder<ConnectivityResult>(
                  stream: Provider.of<BaseProvider>(context).stream,
                  builder: (context, snapshot) {
                    return Text("${snapshot.data}");
                  },
                ),
                actions: [
                  Switch(
                    value: platformProvider.isAndroid,
                    onChanged: (value) {
                      platformProvider.changePlatform();
                    },
                  ),
                ],
                bottom: TabBar(
                  indicatorSize: TabBarIndicatorSize.label,
                  tabs: [
                    Tab(icon: Icon(Icons.account_box)),
                    Tab(text: "Chats"),
                    Tab(text: "Calls"),
                    Tab(text: "Setting"),
                  ],
                ),
              ),
              bottomSheet: Consumer<BaseProvider>(
                builder: (context, value, child) {
                  if (value.connectivityResult == ConnectivityResult.none) {
                    return Container(
                      color: Colors.red,
                      width: double.infinity,
                      height: 30,
                      alignment: Alignment.center,
                      child: Text(
                        "No Internet Connection",
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  } else {
                    return SizedBox();
                  }
                },
              ),
              body: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                // dragStartBehavior: DragStartBehavior.down,
                children: tabsList,
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  Provider.of<BaseProvider>(context, listen: false).checkInternet();
                },
                child: Icon(Icons.add),
              ),
            ),
          );
        } else {
          return CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
                trailing: CupertinoSwitch(
              value: platformProvider.isAndroid,
              onChanged: (value) {
                platformProvider.changePlatform();
              },
            )),
            child: CupertinoTabScaffold(
              tabBar: CupertinoTabBar(items: [
                BottomNavigationBarItem(icon: Icon(CupertinoIcons.person_add)),
                BottomNavigationBarItem(icon: Icon(CupertinoIcons.chat_bubble_2)),
                BottomNavigationBarItem(icon: Icon(CupertinoIcons.phone)),
                BottomNavigationBarItem(icon: Icon(CupertinoIcons.settings))
              ]),
              tabBuilder: (context, index) {
                return tabsList[index];
              },
            ),
          );
        }
      },
    );
  }
}
