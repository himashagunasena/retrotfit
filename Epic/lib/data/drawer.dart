import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:hexcolor/hexcolor.dart';

Widget Navigation() {
  return Container(
      height: 780,
      child: Drawer(
          child: Container(
        color: HexColor("#F6F5F5"),
        child: ListView(
          children: <Widget>[
            Row(children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 17, top: 15, bottom: 16),
                height: 90.0,
                width: 90.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/propic.jpg'),
                  ),
                  shape: BoxShape.circle,
                ),
              ),
              Column(children: <Widget>[
                Container(
                    margin: EdgeInsets.only(
                      top: 30,
                      bottom: 10,
                    ),
                    child: Text(
                      "User Name",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: HexColor("#8164a9")),
                      textAlign: TextAlign.left,
                    )),
                Container(
                    margin: EdgeInsets.only(bottom: 16, left: 18),
                    child: Text(
                      "username@gmail.com",
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
                      textAlign: TextAlign.left,
                    )),
              ]),
            ]),
            Divider(
              color: HexColor("#D4C6E5"),
              thickness: 1.5,
              height: 16,
              indent: 16,
              endIndent: 16,
            ),
            Container(
              margin: EdgeInsets.only(left: 18, top: 16),
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.home_filled, color: Colors.black54),
                    title: Text(
                      "Item 1",
                      style: TextStyle(fontSize: 15, color: Colors.black54),
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.person,
                      color: Colors.black54,
                    ),
                    title: Text(
                      "Item 2",
                      style: TextStyle(fontSize: 15, color: Colors.black54),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      )));
}
