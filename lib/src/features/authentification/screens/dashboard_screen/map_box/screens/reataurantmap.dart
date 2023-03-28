import 'dart:convert';


import 'package:flutter/material.dart';


import '../../../../../../../main.dart';
import '../../../../../../constants/colors.dart';
import '../restaurant_constants/restaurant_stations.dart';
import '../widgets/stations_card.dart';
import 'navigate.dart';

class HomeResto extends StatefulWidget {
  const HomeResto({Key? key}) : super(key: key);
  static String id = 'home';

  @override
  State<HomeResto> createState() => _HomeRestoState();
}

class _HomeRestoState extends State<HomeResto> {
  late String name, address;
  List<String> distanceInKm = sharedPreferences.getStringList('distances')!;
  List<bool> selectedStation = List.generate(4, (index) => false);

  @override
  void initState() {
    Map currentLocation = json.decode(sharedPreferences.getString('location')!);
    name = currentLocation['name'];
    address = currentLocation['address'];
    super.initState();
  }

  void handleStartTrip() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) =>
                Navigate(stationIndex: selectedStation.indexOf(true))));
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> stationDetails = [];
    for (int i = 0; i < restaurants.length; i++) {
      if (double.parse(distanceInKm[i]) <= 5.000) {
        stationDetails.add(
          GestureDetector(
            onTap: () {
              setState(() {
                selectedStation[i] = !selectedStation[i]; // toggle the selection
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
      appBar: AppBar(title: const Text('Stations near you'),centerTitle: true,backgroundColor: tRed),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Text('Your location',
                  style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 10),
              Row(
                children: [
                  Image.asset('assets/icon/maps.png', height: 80, width: 80),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(name,
                            style: Theme.of(context).textTheme.bodyLarge),
                        Text(address),
                        const SizedBox(height: 5),
                        GestureDetector(
                          onTap: () {},
                          child: Row(
                            children: const [
                              Icon(Icons.explore,
                                  size: 16, color: Colors.red),
                              SizedBox(width: 3),
                              Text('See on map',
                                  style: TextStyle(color: Colors.red))
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 30),
              Text('Stations nearby',
                  style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 30),
              SizedBox(
                height: 300,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: stationDetails,
                ),
              ),
              const Spacer(),
              ElevatedButton(
                style:
                    ElevatedButton.styleFrom(backgroundColor:Colors.red,
                        padding: const EdgeInsets.all(15)),
                child: const Center(child: Text('Start my trip', style: TextStyle(color: Colors.white),)),
                onPressed: selectedStation.contains(true) ? handleStartTrip : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
