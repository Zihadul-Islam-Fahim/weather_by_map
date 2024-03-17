import 'package:get/get.dart';
import 'package:weather_map/ui/state_holders/location_controller.dart';
import 'package:weather_map/ui/state_holders/map_controller.dart';
import 'package:weather_map/ui/state_holders/weather_controller.dart';

class ControllerBinder extends Bindings{
  @override
  void dependencies() {
   Get.put(WeatherController());
   Get.put(LocationController());
   Get.put(MapController());
  }

}