import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:location/location.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

import '../../../../../../main.dart';
import '../map_box/helpers/mapbox_handler.dart';
import '../map_box/screens/home_management.dart';
import '../map_box/screens/reataurantmap.dart';
import '../map_box/screens/splash.dart';
import 'package:rolex_stands_finding/src/features/authentification/screens/dashboard_screen/map_box/screens/restaurants_table.dart';

class DashContainerBox extends StatefulWidget {
  const DashContainerBox({
    super.key,
  });

  @override
  State<DashContainerBox> createState() => _DashContainerBoxState();
}

class _DashContainerBoxState extends State<DashContainerBox> {

  void initState() {
    initializeLocationAndSave();
    super.initState();
  }

  void initializeLocationAndSave() async {
    // Ensure all permissions are collected for Locations
    Location _location = Location();
    bool? _serviceEnabled;
    PermissionStatus? _permissionGranted;

    _serviceEnabled = await _location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await _location.requestService();
    }

    _permissionGranted = await _location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await _location.requestPermission();
    }

    // Get capture the current user location
    LocationData _locationData = await _location.getLocation();
    LatLng currentLatLng =
    LatLng(_locationData.latitude!, _locationData.longitude!);
    Map currentLocation = await getParsedReverseGeocoding(currentLatLng);

    List<String> stationDistance = List.generate(4, (index) => '0');
    for (int i = 0; i < 4; i++) {
      Map response = await getDirectionsAPIResponse(currentLatLng, i);
      double distanceInKm = response['distance'] / 1000;
      if (distanceInKm <= 5.000) {
        stationDistance[i] = distanceInKm.toStringAsFixed(2);
      }
    }


    // Store the user location in sharedPreferences
    sharedPreferences.setString('location', json.encode(currentLocation));
    sharedPreferences.setDouble('latitude', _locationData.latitude!);
    sharedPreferences.setDouble('longitude', _locationData.longitude!);
    sharedPreferences.setStringList('distances', stationDistance);

    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (_) => const HomeManagement()), (route) => false);
  }


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: (){
              Get.to(() => HomeManagement());
            },
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
              ),
              height: 100,
              width: 160,
              child: Column(

                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.location_on),
                  Text("Local", )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: (){},
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
              ),
              height: 100,
              width: 170,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(LineAwesomeIcons.book_of_the_dead),
                  Text("Rolex stand")
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}