import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../../main.dart';
import '../../../../../../constants/colors.dart';
import '../restaurant_constants/restaurant_stations.dart';
import '../widgets/stations_card.dart';



class RestaurantsTable extends StatefulWidget {

  const RestaurantsTable({Key? key}) : super(key: key);

  @override
  State<RestaurantsTable> createState() => _RestaurantsTableState();
}

class _RestaurantsTableState extends State<RestaurantsTable> {

  List<String> distanceInKm = sharedPreferences.getStringList('distances')!;
  List<bool> selectedStation = List.generate(4, (index) => false);




  @override
  Widget build(BuildContext context) {
    List<Widget> stationDetails = [];
    for (int i = 0; i < restaurants.length; i++) {
      if (double.parse(distanceInKm[i]) <= 5.000) {
        stationDetails.add(
          GestureDetector(
            onTap: () {
              setState(() {
                selectedStation[i] = !selectedStation[i];
              });
            },

            child: StationsCard(
              name: restaurants[i]['name'],
              distance: distanceInKm[i],
              imageUrl: restaurants[i]['image'],
              isSelected: selectedStation[i],
            ),
          ),
        );
      }
    }


    return Scaffold(
      appBar: AppBar(
        backgroundColor: tRed,
        title: const Text('Restaurants Table'),
        centerTitle: true,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CupertinoTextField(
                    prefix: Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Icon(Icons.search),
                    ),
                    padding: EdgeInsets.all(15),
                    placeholder: 'Search dish or restaurant name',
                    style: TextStyle(color: Colors.black),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                  ),
                  const SizedBox(height: 5),
                  SizedBox(
                    height: 500,
                    child: ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      children: stationDetails,
                    ),
                  ),

                ],
              ),
            ),
          )),
    );
  }
}
