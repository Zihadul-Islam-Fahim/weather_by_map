import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:weather_map/controller_binder.dart';
import 'package:weather_map/ui/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: "Weather App",
        initialBinding: ControllerBinder(),
        debugShowCheckedModeBanner: false,
        home: const HomePage());
  }
}
