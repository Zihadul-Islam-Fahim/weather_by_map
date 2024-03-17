import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_map/data/models/network_response.dart';
import 'package:weather_map/ui/state_holders/location_controller.dart';
import '../state_holders/weather_controller.dart';
import '../widgets/api_call_error_container.dart';
import '../widgets/home_body_container.dart';
import '../widgets/loading_container.dart';
import 'map_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int statusCode = 200;
  WeatherController weatherController = Get.find<WeatherController>();
  LocationController locationController = Get.find<LocationController>();

  void getWeatherData() async {
    NetworkResponse response = await weatherController.getWeatherData();
    statusCode = response.statusCode!;
  }

  @override
  void initState() {
    locationController.getLocation();
    getWeatherData();
    log(Get.height.toString());
    log(Get.width.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      floatingActionButton: Align(
        heightFactor: 1.6,
        widthFactor: 1.9,
        child: FloatingActionButton(
          elevation: 9,
          backgroundColor: Colors.transparent,
          onPressed: () {
            Get.to(() => const GMap());
          },
          child: Image.asset(
            'assets/web.png',
            width: 200,
          ),
        ),
      ),
      body: GetBuilder<WeatherController>(
        builder: (controller) {
          if (controller.isLoading) {
            return loadingContainer(size);
          } else if (statusCode == 200) {
            return SafeArea(
              child: bodyContainer(size, context, controller.weatherModel),
            );
          } else if (statusCode == 429) {
            return Center(
              child: apiCallErrorContainer(),
            );
          } else {
            return const SizedBox(child: Text('Null data'));
          }
        },
      ),
    );
  }
}
