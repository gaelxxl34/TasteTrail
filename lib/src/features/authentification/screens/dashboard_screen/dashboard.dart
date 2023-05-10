
import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:location/location.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:rolex_stands_finding/src/features/authentification/screens/dashboard_screen/widgets/catalog_box.dart';
import 'package:rolex_stands_finding/src/features/authentification/screens/dashboard_screen/widgets/dashboard_container_box.dart';

import '../../../../../main.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/image_strings.dart';
import '../../controllers/user_details_controller.dart';
import '../../models/user_model.dart';
import 'map_box/helpers/mapbox_handler.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late User? firebaseUser;

  late Future<User?> _userFuture;

  @override
  void initState() {
    super.initState();
    _userFuture = FirebaseAuth.instance.authStateChanges().first;
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
      stationDistance[i] =
          ((await getDirectionsAPIResponse(currentLatLng, i))['distance'] /
              1000)
              .toStringAsFixed(4);
    }

    // Store the user location in sharedPreferences
    sharedPreferences.setString('location', json.encode(currentLocation));
    sharedPreferences.setDouble('latitude', _locationData.latitude!);
    sharedPreferences.setDouble('longitude', _locationData.longitude!);
    sharedPreferences.setStringList('distances', stationDistance);
  }


  @override
  Widget build(BuildContext context) {
    var controller = Get.put(UserDetailsController());

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 25),

                // -- page header
              FutureBuilder(
                future: controller.getUserData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      UserModel userData = snapshot.data as UserModel;
                      return Column(
                        children: [
                          Text(
                            "Hello, ${userData.firstname}! it's a beautiful day",
                            style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold, color: Colors.black),

                          ),
                        ],
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    } else {
                      return Center(child: Text('Something went wrong'));
                    }
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
                SizedBox(height: 9),

                Container(
                  padding: EdgeInsets.all(10),
                  width: double.infinity,
                  height: 160,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(photoHome),
                      fit: BoxFit.cover
                    ),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),

                      boxShadow: [
                        BoxShadow(
                          blurRadius: 2.0,
                        )
                      ]),
                 // child: const Text("Find the nearest stand or local food and get natural food for breakfast, launch or dinner enjoy, Eat Bio!"),
                ),
                SizedBox(height: 30),

                Text(
                  'Catalogues',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                ),

                //-- This the box of the catalogue
                CatalogBox(),
                SizedBox(height: 6),


                // -- our services section
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Services',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: tRed),

                    ),
                    Icon(Icons.location_on, color: tRed,),
                  ],
                ),

                DashContainerBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
