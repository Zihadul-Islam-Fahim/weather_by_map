import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:weather_map/ui/state_holders/location_controller.dart';
import 'package:weather_map/ui/state_holders/map_controller.dart';
import '../state_holders/weather_controller.dart';
import 'home_screen.dart';

class GMap extends StatefulWidget {
  const GMap({super.key});

  @override
  State<GMap> createState() => _GMapState();
}

class _GMapState extends State<GMap> {
  Location? location;
  WeatherController weatherController = Get.find<WeatherController>();
  LocationController locationController = Get.find<LocationController>();
  MapController mapController = Get.find<MapController>();
  late GoogleMapController googleMapController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<MapController>(
          builder: (controller) {
            return Stack(
              children: [
                GoogleMap(
                  onTap: (latLng) async {
                    final bool result = await controller.mapOnTap(latLng);
                    if (!result) {
                      Get.snackbar(
                        'Could\'nt get Location',
                        'Try to tap on available location',
                        colorText: Colors.white,
                        backgroundColor: Colors.red,
                      );
                    } else {
                      Get.offAll(() => const HomePage());
                    }
                  },
                  onMapCreated: (controller) async {
                    googleMapController = controller;
                    weatherController.setInitialData();
                  },
                  myLocationEnabled: true,
                  myLocationButtonEnabled: true,
                  initialCameraPosition: CameraPosition(
                    zoom: 5,
                    tilt: 5,
                    bearing: 7,
                    target: controller.hasLocation
                        ? const LatLng(23.81142987470769, 90.41848346271706)
                        : LatLng(weatherController.lat, weatherController.lon),
                  ),
                  markers: {
                    Marker(
                      markerId: const MarkerId('initial'),
                      position: controller.hasLocation
                          ? const LatLng(23.81142987470769, 90.41848346271706)
                          : LatLng(
                              weatherController.lat, weatherController.lon),
                    )
                  },
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    height: 70,
                    width: 300,
                    color: Colors.white.withOpacity(0.7),
                    child: const Center(
                      child: Text(
                        "Tap any Location to \ncheck weather of there.",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Colors.red,
                            fontFamily: 'Poppins'),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Card(
                    color: Colors.white,
                    child: IconButton(
                      onPressed: () async {
                        googleMapController.animateCamera(
                          CameraUpdate.newCameraPosition(
                            CameraPosition(
                              zoom: 13,
                              target: LatLng(
                                  weatherController.lat, weatherController.lon),
                            ),
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.my_location_outlined,
                        size: 30,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
