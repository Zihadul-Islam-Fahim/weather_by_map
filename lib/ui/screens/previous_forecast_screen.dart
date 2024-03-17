import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weather_map/data/models/weather_model.dart';
import '../state_holders/weather_controller.dart';
import '../utility/app_colors.dart';
import '../utility/set_weather_code.dart';
import '../utility/time_convert.dart';

class PreviousForecastList extends StatefulWidget {
  const PreviousForecastList({super.key});

  @override
  State<PreviousForecastList> createState() => _PreviousForecastListState();
}

class _PreviousForecastListState extends State<PreviousForecastList> {
  WeatherModel weatherModel = Get.find<WeatherController>().weatherModel;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: weatherModel.current!.isDay == 1
            ? Colors.lightBlueAccent
            : Colors.indigoAccent,
        title: const Text(
          'Previous Forecast',
          style: TextStyle(fontFamily: 'poppins'),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: weatherModel.daily!.time!.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(left: 17, top: 10, right: 17),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            height: size.height * 0.15,
            width: size.width,
            decoration: BoxDecoration(
              border: Border.all(
                  color: AppColors.secondaryColor.withOpacity(0.6), width: 2),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primaryColor.withOpacity(0.2),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                )
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  DateFormat('d MMM').format(convertDateTime(
                      weatherModel.daily!.time![index].toInt())),
                  style: TextStyle(
                      fontSize: Get.height * 0.024,
                      color: Colors.black,
                      fontWeight: FontWeight.w300,
                      fontFamily: 'Poppins'),
                ),
                Image.asset(
                  '${'assets/' + SetWeatherCode.setName(weatherModel.daily!.weatherCode![index]).path}.png',
                  width: size.width * 0.15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Daylight : ${weatherModel.daily!.daylightDuration![index] ~/ 3600} Hr",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: Get.height * 0.02,
                          color: Colors.grey,
                          fontFamily: 'Poppins'),
                    ),
                    Text(
                      "Max ${weatherModel.daily!.temperature2mMax![index].toInt()}°",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: Get.height * 0.02,
                          color: Colors.grey,
                          fontFamily: 'Poppins'),
                    ),
                    Text(
                      'Min ${weatherModel.daily!.temperature2mMin![index].toInt()}°',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: Get.height * 0.02,
                          color: Colors.grey,
                          fontFamily: 'Poppins'),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
