import 'package:Epic/data/drawer.dart';
import 'package:Epic/data/tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:hexcolor/hexcolor.dart';

class ScanQRCode extends StatefulWidget {
  const ScanQRCode({ Key key }) : super(key: key);

  @override
  _ScanQRCodeState createState() => _ScanQRCodeState();
}

class _ScanQRCodeState extends State<ScanQRCode> {
  String qrCode = "Unknown";

  @override
  Widget build(BuildContext context) {
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
      body:Container(
        child: Column(
          children: [
            Text(this.qrCode),
            // ignore: deprecated_member_use
            RaisedButton(
              color: HexColor("#b099c5"),
              onPressed: (){scanQrCode();},
              child: Text(
                "Scan QR",
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
            )
          ],
        ),
      )
    );
  }
  Future<void>scanQrCode() async{
    try{
      final qrCode = await FlutterBarcodeScanner.scanBarcode('#ff6666', "Cancel", true, ScanMode.QR);
      if(!mounted) return;
      setState(() {
        this.qrCode = qrCode;
      });
    }
    on PlatformException{
      qrCode = 'Failed to get platform version';
    }
  }
}