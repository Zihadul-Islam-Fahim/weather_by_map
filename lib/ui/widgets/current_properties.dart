import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_map/data/models/weather_model.dart';
import '../utility/set_weather_code.dart';

Column currentProperties(WeatherModel weatherModel) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Text(
        SetWeatherCode.setName(
          weatherModel.current!.weatherCode,
        ).name.toString(),
        style: TextStyle(
            fontSize: Get.height * 0.03,
            fontWeight: FontWeight.w300,
            fontFamily: 'Poppins'),
      ),
      Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  "Wind Speed ",
                  style: TextStyle(
                      fontSize: Get.height * 0.017,
                      fontWeight: FontWeight.w300,
                      fontFamily: 'Poppins'),
                ),
                const Icon(Icons.air, color: Colors.blueAccent),
                Text(
                  '${weatherModel.current!.windSpeed10m} m/s',
                  style: TextStyle(
                      fontSize: Get.height * 0.017,
                      fontWeight: FontWeight.w300,
                      fontFamily: 'Poppins'),
                )
              ],
            ),
          ],
        ),
      ),
    ],
  );
}
