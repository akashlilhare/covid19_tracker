import '../provider/dataprovider.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Services with ChangeNotifier {
  static const String url = 'https://pomber.github.io/covid19/timeseries.json#';

  static Future<Map<String, List<CovidData>>> getData() async {
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final res = response.body;
        final Map<String, List<CovidData>> covidData = covidDataFromJson(res);
        return covidData;
      } else {
        return Map<String, List<CovidData>>();
      }
    } catch (e) {
      throw Map<String, List<CovidData>>();
    }
  }
}
