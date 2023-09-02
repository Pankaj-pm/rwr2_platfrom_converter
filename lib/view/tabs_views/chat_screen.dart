// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platfrom_converter/provider/base_provider.dart';
import 'package:platfrom_converter/util/constant.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Provider.of<BaseProvider>(context).isAndroid
        ? Scaffold(
            body: ListView.builder(
              itemBuilder: (context, index) {
                return CupertinoContextMenu(
                  actions: [
                    CupertinoContextMenuAction(
                        child: Text("View"), onPressed: () {}, trailingIcon: CupertinoIcons.viewfinder),
                  ],
                  child: ListTile(
                    onTap: () {
                      // showBottomSheet(
                      //   context: context,
                      //   shape: RoundedRectangleBorder(),
                      //   backgroundColor: Colors.red,
                      //   builder: (context) {
                      //     return Container(
                      //       height: 500,
                      //       width: double.infinity,
                      //       child: Column(
                      //         children: [
                      //           ElevatedButton(onPressed: () {
                      //             Navigator.pop(context);
                      //           }, child: Text("Back")),
                      //         ],
                      //       ),
                      //     );
                      //   },
                      // );

                      if (Provider.of<BaseProvider>(context, listen: false).isAndroid && false) {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          enableDrag: false,
                          isDismissible: false,
                          barrierColor: Colors.white10,
                          useSafeArea: true,
                          builder: (context) {
                            return SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    "Title",
                                    style: Theme.of(context).textTheme.headlineMedium,
                                  ),

                                  // ListView.builder(
                                  //   itemCount: 25,
                                  //   shrinkWrap: true,
                                  //   physics: NeverScrollableScrollPhysics(),
                                  //   itemBuilder: (context, index) {
                                  //     return ListTile(
                                  //       leading: CircleAvatar(radius: 23),
                                  //       title: Text("User Name"),
                                  //       trailing: Text("24/1/2015"),
                                  //     );
                                  //   },
                                  // )
                                  ListTile(
                                    leading: CircleAvatar(radius: 23),
                                    title: Text("User Name"),
                                    trailing: IconButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        icon: Icon(Icons.close)),
                                  )
                                ],
                              ),
                            );
                          },
                        );
                      } else {
                        showCupertinoModalPopup(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) {
                            return CupertinoActionSheet(
                              title: Text("Title"),
                              actions: [
                                CupertinoActionSheetAction(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    Navigator.pushNamed(context, routeChatView);
                                  },
                                  isDefaultAction: true,
                                  child: Text("View"),
                                ),
                                CupertinoActionSheetAction(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  isDestructiveAction: true,
                                  child: Text("Delete"),
                                )
                              ],
                              cancelButton: CupertinoActionSheetAction(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text("Cancel")),
                            );
                          },
                        );
                      }
                    },
                    leading: CircleAvatar(radius: 23),
                    title: Text("User Name"),
                    trailing: Text("24/1/2015"),
                  ),
                );
              },
            ),
          )
        : CupertinoPageScaffold(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return CupertinoListTile(
                  onTap: () {
                    Navigator.pushNamed(context, routeChatView);
                  },
                  leading: CircleAvatar(radius: 23),
                  title: Text("User Name"),
                  trailing: Text("24/1/2015"),
                );
              },
            ),
          );
  }
}
