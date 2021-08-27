import 'package:flutter/material.dart';
import 'package:appbar_textfield/appbar_textfield.dart';

class Weather extends StatefulWidget {
  @override
  _WeatherState createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  // This holds a list of fiction users
  // You can use data fetched from a database or cloud as well
  final List<Map<String, dynamic>> _allCity = [
    {
      "title": "Mumbai",
      "location_type": "City",
      "woeid": 12586539,
      "latt_long": "19.076191,72.875877"
    },
    {
      "title": "Brisbane",
      "location_type": "City",
      "woeid": 1100661,
      "latt_long": "-27.468880,153.022827"
    },
    {
      "title": "Baltimore",
      "location_type": "City",
      "woeid": 2358820,
      "latt_long": "39.290550,-76.609596"
    },
    {
      "title": "Dubai",
      "location_type": "City",
      "woeid": 1940345,
      "latt_long": "25.269440,55.308651"
    },
    {
      "title": "Barcelona",
      "location_type": "City",
      "woeid": 753692,
      "latt_long": "41.385578,2.168740"
    },
    {
      "title": "Bangkok",
      "location_type": "City",
      "woeid": 1225448,
      "latt_long": "13.753330,100.504822"
    },
    {
      "title": "Bangalore",
      "location_type": "City",
      "woeid": 2295420,
      "latt_long": "12.955800,77.620979"
    },
    {
      "title": "Addis Ababa",
      "location_type": "City",
      "woeid": 1313090,
      "latt_long": "9.022730,38.746792"
    },
    {
      "title": "Hyderabad",
      "location_type": "City",
      "woeid": 2295414,
      "latt_long": "17.508829,78.434578"
    },
    {
      "title": "Baghdad",
      "location_type": "City",
      "woeid": 1979455,
      "latt_long": "33.338612,44.393890"
    },
    {
      "title": "Ahmedabad",
      "location_type": "City",
      "woeid": 2295402,
      "latt_long": "23.030199,72.569870"
    },
    {
      "title": "Bakersfield",
      "location_type": "City",
      "woeid": 2358492,
      "latt_long": "35.351189,-119.024063"
    },
    {
      "title": "Durban",
      "location_type": "City",
      "woeid": 1580913,
      "latt_long": "-29.855721,31.035110"
    },
    {
      "title": "Mombasa",
      "location_type": "City",
      "woeid": 1528335,
      "latt_long": "-4.053050,39.672852"
    },
    {
      "title": "Ibadan",
      "location_type": "City",
      "woeid": 1393672,
      "latt_long": "7.378840,3.895270"
    }
  ];

  // This list holds the data for the list view
  List<Map<String, dynamic>> _foundUsers = [];
  @override
  initState() {
    // at the beginning, all users are shown
    _foundUsers = _allCity;
    super.initState();
  }

  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = _allCity;
    } else {
      results = _allCity
          .where((user) => user["title"]
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();

      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      _foundUsers = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              style: TextStyle(color: Colors.white),
              onChanged: (value) => _runFilter(value),
              decoration: InputDecoration(
                  labelText: 'Search Location', suffixIcon: Icon(Icons.search)),
            ),
            Expanded(
              child: _foundUsers.length > 0
                  ? ListView.builder(
                      itemCount: _foundUsers.length,
                      itemBuilder: (context, index) => Card(
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
                                    _foundUsers[index]["woeid"].toString(),
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.white),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(bottom: 5),
                                  child: Text(
                                    _foundUsers[index]['title'],
                                    style: TextStyle(
                                        fontSize: 19, color: Colors.white),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(bottom: 5),
                                  child: Text(
                                    '${_foundUsers[index]["location_type"].toString()}',
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.white),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(bottom: 15),
                                  child: Text(
                                    "longitute: " +
                                        '${_foundUsers[index]["latt_long"].toString()}',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ]))
                        ]),
                      ),
                    )
                  : Center(
                      child: Container(
                        padding: EdgeInsets.only(top: 15),
                        child: Text(
                          'No results found',
                          style: TextStyle(fontSize: 24, color: Colors.blue),
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
