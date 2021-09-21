import 'dart:convert';
import 'package:Epic/data/drawer.dart';
import 'package:flutter/material.dart';
import 'package:Epic/data/data.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;
import 'details.dart';
import 'package:Epic/data/tab.dart';

class Weather extends StatefulWidget {
  @override
  _WeatherState createState() => _WeatherState();
}

//Service
class _WeatherState extends State<Weather> {
  // This holds a list of fiction users
  // You can use data fetched from a database or cloud as well
  Future<Null> fetchData() async {
    final response = await http.get(
        Uri.parse('https://www.metaweather.com/api/location/search/?query=ba'));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      setState(
        () {
          for (Map data in jsonResponse) {
            locatioData.add(Data.fromJson(data));
          }
        },
      );
    } else {
      throw Exception('Unexpected error occured!');
    }
  }
//

  // This list holds the data for the list view
  List<Data> _foundResult = ([]);
  List<Data> locatioData = [];

  @override
  initState() {
    // at the beginning, all users are shown
    super.initState();
    fetchData();
    _foundResult = locatioData;
  }

  //serachbar function
  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    List<Data> results = [];
    if (enteredKeyword.isEmpty) {
      results = locatioData;
    } else {
      results = locatioData
          .where((user) =>
              user.title.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    // Refresh the UI
    setState(() {
      _foundResult = results;
    });
  }
  //

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
        backgroundColor: HexColor("#b099c5"),
        title: Text(
          "Cities",
          style: TextStyle(),
        ),
        bottom: TabBarList().buildTabBar(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: 5, right: 5, bottom: 10),
              child: TextField(
                style: TextStyle(color: Colors.black),
                onChanged: (value) => _runFilter(value),
                decoration: InputDecoration(
                    labelText: 'Search Location',
                    labelStyle: TextStyle(
                      fontSize: 15.0,
                      color: HexColor("#b099c5"),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: HexColor("#b099c5"), width: 2.0),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: HexColor("#b099c5"), width: 2.0),
                    ),
                    suffixIcon: Icon(
                      Icons.search,
                      color: HexColor("#b099c5"),
                    )),
              ),
            ),
            Expanded(
              child: _foundResult.length > 0
                  ? ListView.builder(
                      itemCount: _foundResult.length,
                      itemBuilder: (context, index) => Card(
                        elevation: 7,
                        color: Colors.white,
                        margin: EdgeInsets.only(
                            top: 8, left: 10, right: 10, bottom: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(30), // if you need this
                        ),
                        child: Row(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 15),
                              child: Icon(
                                Icons.location_city,
                                size: 50,
                                color: HexColor("#8164a9"),
                              ),
                            ),
                            CityDetails(
                              _foundResult,
                              index,
                            ),
                            //Checkbox
                            Container(
                              padding: EdgeInsets.only(right: 0),
                              alignment: Alignment.centerLeft,
                              child: Checkbox(
                                checkColor: Colors.white, // color of tick Mark
                                activeColor: HexColor("#b099c5"),
                                value: _foundResult[index].value,
                                onChanged: (bool nvalue) {
                                  setState(() {
                                    _foundResult[index].value = nvalue;
                                  });
                                },
                              ),
                            ),
                            //
                          ],
                        ),
                      ),
                    )
                  : Center(
                      child: Container(
                        padding: EdgeInsets.only(top: 0),
                        child: Text(
                          'No results found',
                          style: TextStyle(
                              fontSize: 20,
                              color: HexColor("#8164a9"),
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
