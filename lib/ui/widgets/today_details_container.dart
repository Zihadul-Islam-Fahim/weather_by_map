import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../data/models/weather_model.dart';
import '../utility/set_weather_code.dart';
import '../utility/time_convert.dart';

Container todayDetailsContainer(Size size, WeatherModel weatherModel) {
  return Container(
    height: size.height * 0.19,
    width: size.width,
    margin: EdgeInsets.only(
      left: Get.height * 0.021,
      right: Get.height * 0.021,
      bottom: size.height * 0.015,
    ),
    padding: EdgeInsets.only(
        left: Get.height * 0.012,
        right: Get.height * 0.012,
        top: Get.height * 0.008,
        bottom: Get.height * 0.007),
    decoration: BoxDecoration(
      color: Colors.white.withOpacity(.5),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Today",
              style: TextStyle(
                fontSize: Get.height * 0.019,
                fontWeight: FontWeight.w700,
                fontFamily: 'Poppins',
              ),
            ),
            Text(
              DateFormat('MMMM, d').format(DateTime.now()),
              style: TextStyle(
                  fontSize: Get.height * 0.017,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Poppins'),
            )
          ],
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 24,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, i) {
              return Container(
                height: size.height * 0.2,
                padding: EdgeInsets.only(right: Get.height * 0.017),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        '${weatherModel.hourly!.temperature2m![i]}°',
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: Get.height * 0.019,
                            fontFamily: 'Poppins'),
                      ),
                      Image.asset(
                        '${'assets/' + SetWeatherCode.setName(weatherModel.hourly!.weatherCode![i]).path}.png',
                        width: Get.height * 0.065,
                      ),
                      Text(
                        DateFormat.jm().format(convertDateTime(
                            weatherModel.hourly!.time![i].toInt())),
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: Get.height * 0.017,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    ),
  );
}
