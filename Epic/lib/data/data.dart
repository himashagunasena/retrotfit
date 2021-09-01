import 'package:flutter/material.dart';

class Data {
  final String title;
  final String locationType;
  final int woeid;
  final String lattlong;
  bool value;

  Data({this.title, this.locationType, this.woeid, this.lattlong, this.value});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      title: json['title'],
      locationType: json['location_type'],
      woeid: json['woeid'],
      lattlong: json['latt_long'],
      value: false,
    );
  }
}
