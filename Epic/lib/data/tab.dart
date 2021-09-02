import 'package:Epic/http/profile.dart';
import 'package:Epic/http/wearther.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class TabBarList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(length: 3, child: buildScaffold());
  }

  Widget buildScaffold() {
    return Scaffold(body: buildTabBody());
  }

  Widget buildTabBar() {
    return TabBar(
      labelStyle: TextStyle(fontSize: 16.5),
      indicatorColor: HexColor("#8164a9"),
      tabs: <Widget>[
        Tab(
          text: "Cities",
        ),
        Tab(text: "Image"),
        Tab(text: "Scan"),
      ],
    );
  }

  Widget buildTabBody() {
    return TabBarView(children: <Widget>[
      Weather(),
      Profile(),
      Profile(),
    ]);
  }
}
