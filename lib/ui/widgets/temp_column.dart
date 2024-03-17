import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_map/data/models/weather_model.dart';

import 'current_properties.dart';

Column temperatureColumn(WeatherModel weatherModel) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.end,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Max  ${weatherModel.daily!.temperature2mMax![32].toDouble()}° \nMin   ${weatherModel.daily!.temperature2mMin![33].toDouble()}°",
            style: TextStyle(
                fontSize: Get.height * 0.02,
                fontWeight: FontWeight.w400,
                fontFamily: "Poppins"),
          ),
          currentProperties(weatherModel),
        ],
      )
    ],
  );
}
