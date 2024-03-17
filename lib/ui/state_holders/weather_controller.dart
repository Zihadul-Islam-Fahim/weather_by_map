import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:weather_map/data/models/network_response.dart';
import 'package:weather_map/data/models/weather_model.dart';

import '../utility/urls.dart';
import 'data_store_controller.dart';

class WeatherController extends GetxController {
  bool isLoading = false;

  static String? district = "";
  static String? division = 'Dhaka';
  static String? country = 'Bangladesh';

  bool isMapClicked = false;

  double lat = 23.81142987470769;
  double lon = 90.41848346271706;

  setInitialData() async {
    lat = await DataController.readData('latitude') ?? 23.81142987470769;
    lon = await DataController.readData('longitude') ?? 90.41848346271706;
  }

  setLatLong(LatLng latLng) {
    lat = latLng.latitude;
    lon = latLng.longitude;
    getWeatherData();
  }

  WeatherModel weatherModel = WeatherModel();

  Future<NetworkResponse> getWeatherData() async {
    isLoading = true;
    update();
    http.Response response = await http.get(Uri.parse(Urls().url(lat, lon)));

    if (response.statusCode == 200) {
      weatherModel = WeatherModel.fromJson(jsonDecode(response.body));
      isLoading = false;
      update();
      return NetworkResponse(isSuccess: true, statusCode: response.statusCode);
    } else {
      isLoading = false;
      update();
      return NetworkResponse(isSuccess: false, statusCode: response.statusCode);
    }
  }

  Future<bool> getLocationDetails(double latitude, double longitude) async {
    try {
      List<Placemark> placeMarks =
          await placemarkFromCoordinates(latitude, longitude);
      if (placeMarks.isNotEmpty) {
        Placemark currentPlace = placeMarks[0];
        district = currentPlace.subAdministrativeArea.toString() == ""
            ? ""
            : "${currentPlace.subAdministrativeArea.toString()},";
        division = currentPlace.administrativeArea.toString();
        country = currentPlace.country.toString();
      } else {
        Get.snackbar('Location Not Found', 'Failed ! Try again.',
            backgroundColor: Colors.red, colorText: Colors.white);
      }
      if (placeMarks.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      Get.snackbar('Something went wrong!', 'Try again',
          backgroundColor: Colors.red, colorText: Colors.white);
      return false;
    }
  }
}
