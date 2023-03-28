import 'dart:async';


import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:location/location.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:rolex_stands_finding/src/constants/colors.dart';

import '../../../../../../../main.dart';
import '../helpers/mapbox_handler.dart';
import '../helpers/sharedprefs_data.dart';

import '../restaurant_constants/restaurant_stations.dart';
import '../widgets/ride_details.dart';

class Navigate extends StatefulWidget {
  final int stationIndex;

  const Navigate({Key? key, required this.stationIndex}) : super(key: key);
  static String id = 'navigate';

  @override
  State<Navigate> createState() => _NavigateState();
}

class _NavigateState extends State<Navigate> {
  List<String> stationDistances = sharedPreferences.getStringList('distances')!;
  LatLng latLng = getLatLngFromSharedPrefs();
  Location location = Location();
  int slotCount = 5;

  late int currentStationIndex;
  late CameraPosition _cameraPosition;
  late MapboxMapController controller;
  late List<CameraPosition> _kStationsList;

  late Timer timer;

  @override
  void initState() {
    _cameraPosition = CameraPosition(target: latLng, zoom: 15);
    timer = Timer.periodic(
        const Duration(seconds: 5), (Timer t) => locationUpdate());

    // initialize map symbols for bike stations
    _kStationsList = List<CameraPosition>.generate(
      restaurants.length,
      (index) => CameraPosition(
        target: LatLng(
            double.parse(restaurants[index]['coordinates']['latitude']),
            double.parse(restaurants[index]['coordinates']['longitude'])),
        zoom: 15,
      ),
    );

    currentStationIndex = widget.stationIndex;
    super.initState();
  }

  void _onMapCreated(MapboxMapController controller) {
    this.controller = controller;
    locationUpdate();
  }

  void _addSourceAndLineLayer(int index, bool removeLayer) async {
    // Add a polyLine between source and destination
    Map geometry = (await getDirectionsAPIResponse(latLng, index))['geometry'];
    final _fills = {
      "type": "FeatureCollection",
      "features": [
        {
          "type": "Feature",
          "id": 0,
          "properties": <String, dynamic>{},
          "geometry": geometry,
        },
      ],
    };

    // Remove lineLayer and source if it exists
    if (removeLayer == true) {
      await controller.removeLayer("lines");
      await controller.removeSource("fills");
    }

    // Add new source and lineLayer
    await controller.addSource("fills", GeojsonSourceProperties(data: _fills));
    await controller.addLineLayer(
      "fills",
      "lines",
      LineLayerProperties(
        lineColor: Colors.black.toHexStringRGB(),
        lineCap: "circle",
        lineJoin: "round",
        lineWidth: 5,
        
      ),
    );
  }

  void _onStyleLoadedCallback() async {
    for (CameraPosition _kBikingStation in _kStationsList) {
      await controller.addSymbol(
        SymbolOptions(
          geometry: _kBikingStation.target,
          iconSize: 0.2,
          iconImage: "assets/icon/food.png",
        ),
      );
    }
    _addSourceAndLineLayer(currentStationIndex, false);
  }

  void locationUpdate() async {
    LocationData _locationData = await location.getLocation();
    setState(() {
      slotCount--;
      latLng = LatLng(_locationData.latitude!, _locationData.longitude!);
      _cameraPosition = CameraPosition(target: latLng, zoom: 15);
      controller.animateCamera(CameraUpdate.newCameraPosition(_cameraPosition));
    });

    if (slotCount == 0) {
      currentStationIndex = 0;
      slotCount = 1000;
    }
    _addSourceAndLineLayer(currentStationIndex, true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Trip in progress'),
        backgroundColor: tRed,
      ),

      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: MapboxMap(
                accessToken: dotenv.env['MAPBOX_ACCESS_TOKEN'],
                initialCameraPosition: _cameraPosition,
                onMapCreated: _onMapCreated,
                onStyleLoadedCallback: _onStyleLoadedCallback,
                myLocationEnabled: true,
                myLocationTrackingMode: MyLocationTrackingMode.TrackingGPS,
                minMaxZoomPreference: const MinMaxZoomPreference(15, 20),
              ),
            ),
            rideDetails(context, restaurants[currentStationIndex]['name'],
                '0.88 km away', slotCount),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
