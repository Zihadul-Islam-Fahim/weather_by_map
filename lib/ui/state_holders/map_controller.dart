import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:weather_map/ui/state_holders/weather_controller.dart';
import 'data_store_controller.dart';

class MapController extends GetxController{
  WeatherController weatherController = Get.find<WeatherController>();
  bool hasLocation = false;

  onMapCreated() async{
  await DataController.readData('latitude') == null ?
  hasLocation = false: hasLocation = true;
}

    Future<bool> mapOnTap(LatLng latLng)async {
      weatherController.isMapClicked = true;
     final result = await weatherController.getLocationDetails(latLng.latitude, latLng.longitude);
    if (result) {
      weatherController.setLatLong(latLng);
      update();
      return true;
    } else {
      update();
      return false ;
    }
  }
}