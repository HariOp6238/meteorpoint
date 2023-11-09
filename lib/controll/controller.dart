import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import 'package:http/http.dart' as http;
import 'package:meteorpoint/model/models.dart';

class Controller with ChangeNotifier {
  Apireponse? responsedata;
  List<dynamic> datalist = [];
  getweatherdata() async {
    final url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=Delhi,IN&appid=ea6ca3ee6d58442868c973ccc9ec895f');

    var response = await http.get(url);
    if (response.statusCode == 200) {
      print(response.statusCode);

      var decodedata = jsonDecode(response.body);

      responsedata = Apireponse.fromJson(decodedata);
      datalist = responsedata?.weather ?? [];

      notifyListeners();
    } else {
      print('failed to load');
    }
  }

  Future<String> getcurrentcity() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    // Fetch the current location

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    // convert the location into a list of placemark
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    // extract the city name from the place mark

    String? city = placemarks[0].locality;
    return city ?? '';
  }
}
