import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../data/models/weather_model.dart';
import '../screens/previous_forecast_screen.dart';
import '../utility/app_colors.dart';
import '../utility/set_weather_code.dart';
import '../utility/time_convert.dart';

GestureDetector previousDetailList(
    Size size, context, WeatherModel weatherModel) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const PreviousForecastList()));
    },
    child: Container(
      margin: EdgeInsets.symmetric(horizontal: Get.height * 0.019),
      padding: const EdgeInsets.all(10),
      height: Get.height * 0.35,
      width: size.width,
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.5),
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Previous Forecast",
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins'),
                ),
                Row(
                  children: [
                    Text(
                      "Details ",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Poppins'),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                    )
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: weatherModel.daily!.time!.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(left: 10, top: 20, right: 10),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  height: size.height * 0.08,
                  width: size.width,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: AppColors.secondaryColor.withOpacity(0.6),
                        width: 2),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          color: AppColors.primaryColor.withOpacity(0.2),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3))
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        DateFormat("d MMM").format(convertDateTime(
                            weatherModel.daily!.time![index].toInt())),
                        style: const TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 18,
                            fontFamily: 'Poppins'),
                      ),
                      Image.asset(
                        '${'assets/' + SetWeatherCode.setName(weatherModel.daily!.weatherCode![index]).path}.png',
                        width: size.width * 0.13,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "${weatherModel.daily!.temperature2mMax![index].toInt()}°",
                            style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 18,
                                fontFamily: 'Poppins'),
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                          Text(
                            ' ${weatherModel.daily!.temperature2mMin![index].toInt()}°',
                            style: const TextStyle(
                                fontWeight: FontWeight.w300,
                                fontFamily: 'Poppins'),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    ),
  );
}
