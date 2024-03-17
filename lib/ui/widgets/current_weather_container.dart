import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_map/data/models/weather_model.dart';
import 'package:weather_map/ui/widgets/temp_column.dart';

Container currentWeatherContainer(
    Size size, int isDay, WeatherModel weatherModel) {
  return Container(
    margin: EdgeInsets.symmetric(
        horizontal: Get.height * 0.02, vertical: Get.height * 0.015),
    padding: const EdgeInsets.only(left: 16, top: 6, right: 16),
    height: size.height * 0.2536,
    width: size.width,
    clipBehavior: Clip.hardEdge,
    decoration: BoxDecoration(
      color: Colors.white.withOpacity(0.5),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          children: [
            Icon(
              isDay == 1
                  ? Icons.sunny
                  : Icons.nightlight_round,
              color: Colors.yellowAccent.withOpacity(0.9),
              size: Get.height * 0.044,
            ),
            Text(
              isDay == 1 ? "Day" : "Night",
              style: const TextStyle(
                  fontWeight: FontWeight.w100,
                  fontSize: 20,
                  fontFamily: 'Poppins'),
            )
          ],
        ),
        Text(
          '${weatherModel.current!.temperature2m!.toInt()}°',
          style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: Get.height * 0.07,
              fontFamily: 'Poppins'),
        ),
        temperatureColumn(weatherModel),
      ],
    ),
  );
}
