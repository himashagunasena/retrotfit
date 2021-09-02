import 'dart:convert';
import 'package:Epic/data/cache.dart';
import 'package:Epic/data/drawer.dart';
import 'package:flutter/material.dart';

import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;

import 'package:Epic/data/tab.dart';

class Profile extends StatelessWidget {
  bool isButton = false;
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
            "Image",
            style: TextStyle(),
          ),
          bottom: TabBarList().buildTabBar(),
        ),
        body: Column(children: [
          Container(
              padding: EdgeInsets.only(top: 10, left: 10, right: 10),
              child: Image.network(
                'https://images.unsplash.com/photo-1519501025264-65ba15a82390?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8MTF8fHxlbnwwfHx8fA%3D%3D&w=1000&q=80',
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                      margin: EdgeInsets.only(top: 150),
                      alignment: Alignment.center,
                      child: Column(children: [
                        Container(
                            margin: EdgeInsets.only(bottom: 10),
                            child: Text(
                              'Oops! ',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: HexColor("#9579CC")),
                            )),
                        Center(
                            child: Text(
                          'Check Connection Or Click the View image button',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: HexColor("#9579CC")),
                        )),
                        Container(
                          margin: EdgeInsets.only(top: 15),
                          width: 130,
                          height: 130,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/load.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                      ]));
                },
              )),
          Container(
              width: 200,
              height: 40,
              margin: EdgeInsets.only(top: 30),
              child: RaisedButton(
                  color: HexColor("#b099c5"),
                  onPressed: () {
                    setState(
                      () {
                        isButton = !isButton;
                      },
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CatchImage()),
                    );
                  },
                  child: Text(
                    "View Image",
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ))),
        ]));
  }

  void setState(Null Function() param0) {}
}
