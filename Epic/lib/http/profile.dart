import 'dart:convert';
import 'package:Epic/data/drawer.dart';
import 'package:flutter/material.dart';
import 'package:Epic/data/data.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;
import 'details.dart';
import 'package:Epic/data/tab.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: ClipRRect(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(35), bottomRight: Radius.circular(35)),
        child: Navigation(),
      ),
      backgroundColor: HexColor("#F6F5F5"),
      appBar: AppBar(
        backgroundColor: HexColor("#9579CC"),
        title: Text(
          "Profile",
          style: TextStyle(),
        ),
        bottom: TabBarList().buildTabBar(),
      ),
      body: Container(),
    );
  }
}
