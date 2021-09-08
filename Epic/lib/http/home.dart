import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:Epic/data/tab.dart';

class Home extends StatelessWidget {
  final Shader linearGradient = LinearGradient(
    colors: <Color>[HexColor("#8164a9"), HexColor("#b099c5")],
  ).createShader(
    Rect.fromLTWH(0.0, 0.0, 350.0, 70.0),
  );

  @override
  Widget build(BuildContext context) {
    bool isButton = false;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
          child: Column(children: [
        Container(
          margin: EdgeInsets.only(top: 200, bottom: 50),
          child: Text(
            "City App",
            style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w800,
                foreground: Paint()..shader = linearGradient),
          ),
        ),
        Container(
          height: 250.0,
          width: 250.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/home.jpg'),
              fit: BoxFit.cover,
            ),
            shape: BoxShape.circle,
          ),
        ),
        Container(
            height: 50.0,
            width: 200,
            margin: EdgeInsets.only(top: 200),
            child: RaisedButton(
              onPressed: () {
                setState(
                  () {
                    isButton = !isButton;
                  },
                );
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TabBarList()),
                );
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(80.0)),
              padding: EdgeInsets.all(0.0),
              elevation: 6,
              child: Ink(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [HexColor("#8164a9"), HexColor("#b099c5")],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(30.0)),
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    "Getting Start",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
              ),
            )),
      ])),
    );
  }

  void setState(Null Function() param0) {}
}
