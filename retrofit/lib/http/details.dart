import 'package:flutter/material.dart';
import 'package:Epic/data/data.dart';
import 'package:hexcolor/hexcolor.dart';

Widget CityDetails(myObject, index) {
  return Container(
      //id
      padding: EdgeInsets.only(left: 20, right: 10),
      child: Column(children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: 15, bottom: 5),
          child: Text(
            myObject[index].woeid.toString(),
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 14, color: HexColor("#8164a9")),
          ),
        ),
        Container(
          //title
          padding: EdgeInsets.only(bottom: 5),
          child: Text(
            myObject[index].title,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 19,
              color: HexColor("#8164a9"),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          //type
          padding: EdgeInsets.only(bottom: 5),
          child: Text(
            '${myObject[index].locationType.toString()}',
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 14, color: HexColor("#8164a9")),
          ),
        ),
        Container(
          //long
          padding: EdgeInsets.only(bottom: 15, right: 10),
          child: Text(
            "longitute: " + '${myObject[index].lattlong.toString()}',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 12,
              color: HexColor("#8164a9"),
            ),
          ),
        ),
      ]));
}
