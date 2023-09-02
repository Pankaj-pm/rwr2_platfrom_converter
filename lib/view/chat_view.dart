import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platfrom_converter/provider/base_provider.dart';
import 'package:provider/provider.dart';

class ChatView extends StatefulWidget {
  const ChatView({Key? key}) : super(key: key);

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  @override
  Widget build(BuildContext context) {
    return Provider.of<BaseProvider>(context).isAndroid
        ? Scaffold(
            body: CustomScrollView(
              slivers: [
                SliverAppBar(
                  pinned: true,
                  // title: Text("Chat"),
                  expandedHeight: 200,
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  flexibleSpace: FlexibleSpaceBar(
                    title: Text("Chat"),
                    // expandedTitleScale: 5,
                    collapseMode: CollapseMode.none,
                    background: Image.network(
                      "https://scanbot.io/wp-content/uploads/2022/03/flutter_tutorial_hero.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    bool isOddEven = index % 2 == 0;
                    return Container(
                      decoration: BoxDecoration(
                          color: Colors.cyan,
                          borderRadius: BorderRadius.circular(
                            5,
                          )),
                      margin: EdgeInsets.only(top: 5, bottom: 5, right: isOddEven ? 50 : 5, left: isOddEven ? 5 : 50),
                      padding: EdgeInsets.all(12),
                      child: Text(
                        "Chat $index",
                      ),
                    );
                  }, childCount: 5),
                ),
                SliverGrid.builder(
                  itemCount: 12,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
                  itemBuilder: (context, index) {
                    return Container(
                      color: Colors.red,
                      margin: EdgeInsets.all(5),
                    );
                  },
                ),
                SliverFillRemaining()
              ],
            ),
          )
        : CupertinoPageScaffold(
            child: CustomScrollView(
            slivers: [
              CupertinoSliverNavigationBar(
                largeTitle: Text("Chat"),
                middle: Text("Chat screen"),
                alwaysShowMiddle: false,
                stretch: false,
              ),
              SliverList(
                  delegate: SliverChildBuilderDelegate(
                childCount: 5,
                (context, index) {
                  bool isOddEven = index % 2 == 0;
                  return Container(
                    decoration: BoxDecoration(
                        color: Colors.cyan,
                        borderRadius: BorderRadius.circular(
                          5,
                        )),
                    margin: EdgeInsets.only(top: 5, bottom: 5, right: isOddEven ? 50 : 5, left: isOddEven ? 5 : 50),
                    padding: EdgeInsets.all(12),
                    child: Text("Chat $index"),
                  );
                },
              )),
              SliverFillRemaining(),
            ],
          ));
  }
}
