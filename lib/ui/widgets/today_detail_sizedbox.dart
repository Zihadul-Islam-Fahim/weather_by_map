import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../data/models/weather_model.dart';
import '../state_holders/weather_controller.dart';
import '../utility/set_weather_code.dart';
import 'current_weather_container.dart';
import 'developer_info_popup.dart';

SizedBox todayDetailSizeBox(Size size, WeatherModel weatherModel) {
  return SizedBox(
    width: size.width,
    child: Stack(children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 5),
            child: SizedBox(
              width: Get.width * 0.9,
              child: Text(
                "${WeatherController.district!.replaceAll("District", '')}${WeatherController.division!.replaceAll('Division', '')}",
                style: TextStyle(
                    color: weatherModel.current!.isDay == 1
                        ? Colors.black
                        : Colors.white,
                    fontSize: Get.height * 0.028,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Poppins',
                    overflow: TextOverflow.ellipsis),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      '${WeatherController.country}',
                      style: TextStyle(
                        fontSize: Get.height * 0.023,
                        fontFamily: 'Poppins',
                        color: weatherModel.current!.isDay == 1
                            ? Colors.black
                            : Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      DateFormat('E, d MMMM').format(DateTime.now()),
                      style: TextStyle(
                          color: weatherModel.current!.isDay == 1
                              ? Colors.black54
                              : Colors.white70,
                          fontSize: Get.height * 0.02,
                          fontWeight: FontWeight.w300,
                          fontFamily: 'Poppins'),
                    ),
                  ),
                ],
              ),
              currentWeatherContainer(
                  size, weatherModel.current!.isDay!.toInt(), weatherModel),
            ],
          ),
        ],
      ),
      Positioned(
        top: Get.height * 0.074,
        left: Get.width * 0.46,
        child: Image.asset(
          'assets/' +
              SetWeatherCode.setName(weatherModel.current!.weatherCode).path +
              '.png',
          width: Get.height * 0.214,
        ),
      ),
      Align(
        alignment: Alignment.topRight,
        child: developerInfoPopup(),
      )
    ]),
  );
}
