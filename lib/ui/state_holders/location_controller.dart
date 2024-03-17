import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:weather_map/ui/state_holders/weather_controller.dart';
import 'data_store_controller.dart';

class LocationController extends GetxController {
  bool serviceEnabled = false;
  WeatherController weatherController = Get.find<WeatherController>();

  getLocation() async {
    Location location = Location();

    LocationData? locationData;
    PermissionStatus status = await location.hasPermission();
    serviceEnabled = await location.serviceEnabled();

    if (weatherController.isMapClicked) {
      await weatherController.getWeatherData();
      update();
    } else {
      if (!serviceEnabled) {
        await location.requestService();
      }
      if (status == PermissionStatus.denied ||
          status == PermissionStatus.deniedForever) {
        await location.requestPermission();
        status = await location.hasPermission();
        if (status == PermissionStatus.granted ||
            status == PermissionStatus.grantedLimited) {
          getLocation();
          update();
        }
      } else {
        if (await DataController.readData('latitude') == null) {
          locationData = await location.getLocation();
          await DataController.writeData('latitude', locationData.latitude);
          await DataController.writeData('longitude', locationData.longitude);
          weatherController.setLatLong(
              LatLng(locationData.latitude!, locationData.longitude!));
          weatherController.lat =
              await DataController.readData('latitude') ?? 0;
          weatherController.lon =
              await DataController.readData('longitude') ?? 0;

          await weatherController.getLocationDetails(
              weatherController.lat, weatherController.lon);

          weatherController.getWeatherData();
          update();
        } else {
          weatherController.lat =
              await DataController.readData('latitude') ?? 0;
          weatherController.lon =
              await DataController.readData('longitude') ?? 0;

          await weatherController.getLocationDetails(
              weatherController.lat, weatherController.lon);

          await weatherController.getWeatherData();
          update();
        }
      }
    }
  }
}
