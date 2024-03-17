import 'package:flutter/material.dart';
import 'package:weather_map/data/models/weather_model.dart';
import 'package:weather_map/ui/widgets/prev_detail_list.dart';
import 'package:weather_map/ui/widgets/today_detail_sizedbox.dart';
import 'package:weather_map/ui/widgets/today_details_container.dart';

Container bodyContainer(
    Size size, BuildContext context, WeatherModel weatherModel) {
  return Container(
    height: size.height,
    width: size.width,
    decoration: BoxDecoration(
        gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        weatherModel.current?.isDay == 0
            ? Colors.indigoAccent.withOpacity(0.9)
            : Colors.lightBlueAccent.withOpacity(0.9),
        weatherModel.current?.isDay == 0
            ? Colors.indigoAccent.withOpacity(0.9)
            : Colors.lightBlueAccent.withOpacity(0.9),
      ],
    )),
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          todayDetailSizeBox(size, weatherModel),
          todayDetailsContainer(size, weatherModel),
          previousDetailList(size, context, weatherModel),
        ],
      ),
    ),
  );
}
