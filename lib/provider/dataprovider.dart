// To parse this JSON data, do
//
//     final covidData = covidDataFromJson(jsonString);

import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

Map<String, List<CovidData>> covidDataFromJson(String str) =>
    Map.from(json.decode(str)).map((k, v) => MapEntry<String, List<CovidData>>(
        k, List<CovidData>.from(v.map((x) => CovidData.fromJson(x)))));

String covidDataToJson(Map<String, List<CovidData>> data) =>
    json.encode(Map.from(data).map((k, v) => MapEntry<String, dynamic>(
        k, List<dynamic>.from(v.map((x) => x.toJson())))));

class CovidData with ChangeNotifier{
  CovidData({
    @required this.date,
    @required this.confirmed,
    @required this.deaths,
    @required this.recovered,
  });

  final String date;
  final int confirmed;
  final int deaths;
  final int recovered;

  factory CovidData.fromJson(Map<String, dynamic> json) => CovidData(
        date: json["date"],
        confirmed: json["confirmed"],
        deaths: json["deaths"],
        recovered: json["recovered"],
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "confirmed": confirmed,
        "deaths": deaths,
        "recovered": recovered,
      };
}
