import 'dart:async';
import 'dart:convert';

import 'package:Epic/data/weatherA.dart';
import 'package:Epic/page/weather.dart';
import 'package:Epic/service/api_service.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:Epic/data/data.dart';

// class HomePage extends StatefulWidget {
//   @override
//   HomePageState createState() => new HomePageState();
// }
//
// class HomePageState extends State<HomePage> {
//   List data;
//
//   Future<String> getData() async {
//     var response = await http.get(
//         Uri.encodeFull(
//             "https://www.metaweather.com/api/location/search/?query=ba"),
//         headers: {"Accept": "application/json"});
//
//     this.setState(() {
//       data = json.decode(response.body);
//     });
//
//     return "Success!";
//   }
//
//   @override
//   void initState() {
//     this.getData();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//         appBar: new AppBar(
//             title: new Text("Listviews"), backgroundColor: Colors.blue),
//         body: Column(children: [
//           new ListView.builder(
//             itemCount: data == null ? 0 : data.length,
//             itemBuilder: (BuildContext context, int index) {
//               return new Card(
//                 color: Colors.blue,
//                 margin: EdgeInsets.symmetric(vertical: 10),
//                 child: Row(children: <Widget>[
//                   Container(
//                     margin: EdgeInsets.only(left: 10),
//                     child: Icon(
//                       Icons.location_city,
//                       size: 60,
//                     ),
//                   ),
//                   Container(
//                       margin: EdgeInsets.only(left: 30),
//                       child: Column(children: <Widget>[
//                         Container(
//                           padding: EdgeInsets.only(top: 15, bottom: 5),
//                           child: Text(
//                             data[index]["woeid"].toString(),
//                             style: TextStyle(fontSize: 14, color: Colors.white),
//                           ),
//                         ),
//                         Container(
//                           padding: EdgeInsets.only(bottom: 5),
//                           child: Text(
//                             data[index]['title'],
//                             style: TextStyle(fontSize: 19, color: Colors.white),
//                           ),
//                         ),
//                         Container(
//                           padding: EdgeInsets.only(bottom: 5),
//                           child: Text(
//                             '${data[index]["location_type"].toString()}',
//                             style: TextStyle(fontSize: 14, color: Colors.white),
//                           ),
//                         ),
//                         Container(
//                           padding: EdgeInsets.only(bottom: 15),
//                           child: Text(
//                             "longitute: " +
//                                 '${data[index]["latt_long"].toString()}',
//                             style: TextStyle(
//                               fontSize: 14,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ),
//                       ]))
//                 ]),
//               );
//             },
//           ),
//         ]));
//   }
// }

void main() {
  runApp(new MaterialApp(home: new HomePage()));
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  List data;

  //service code
  Future<String> getData() async {
    var response = await http.get(
        Uri.encodeFull(
            "https://www.metaweather.com/api/location/search/?query=ba"),
        headers: {"Accept": "application/json"});

    this.setState(() {
      data = json.decode(response.body);
    });

    return "Success!";
  }

  @override
  void initState() {
    this.getData();
    Data();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
            title: new Text("Listviews"), backgroundColor: Colors.blue),
        body: new Column(children: <Widget>[
          TextField(
            //search bar
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
                labelText: 'Search Location', suffixIcon: Icon(Icons.search)),
          ),
          new Expanded(
            child: ListView.builder(
              //Listview Builder
              itemCount: data == null ? 0 : data.length,
              itemBuilder: (BuildContext context, int index) {
                return new Card(
                  color: Colors.blue,
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Row(children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Icon(
                        Icons.location_city,
                        size: 60,
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(left: 30),
                        child: Column(children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(top: 15, bottom: 5),
                            child: Text(
                              data[index]["woeid"].toString(),
                              style:
                                  TextStyle(fontSize: 14, color: Colors.white),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(bottom: 5),
                            child: Text(
                              data[index]['title'],
                              style:
                                  TextStyle(fontSize: 19, color: Colors.white),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(bottom: 5),
                            child: Text(
                              '${data[index]["location_type"].toString()}',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.white),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(bottom: 15),
                            child: Text(
                              "longitute: " +
                                  '${data[index]["latt_long"].toString()}',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ]))
                  ]),
                );
              },
            ),
          )
        ]));
  }
}
