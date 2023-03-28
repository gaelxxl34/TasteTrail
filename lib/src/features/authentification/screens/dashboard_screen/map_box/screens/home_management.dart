

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rolex_stands_finding/src/features/authentification/screens/dashboard_screen/map_box/screens/reataurantmap.dart';
import 'package:rolex_stands_finding/src/features/authentification/screens/dashboard_screen/map_box/screens/restaurants_table.dart';

import '../../../../../../constants/colors.dart';

class HomeManagement extends StatefulWidget {
  const HomeManagement({Key? key}) : super(key: key);

  @override
  State<HomeManagement> createState() => _HomeManagementState();
}

class _HomeManagementState extends State<HomeManagement> {
  final List<Widget> _pages = [
    const HomeResto(),
    const RestaurantsTable()
  ];
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_index],
      backgroundColor: tRed,
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: tRed,
        onTap: (selectedIndex) {
          setState(() {
            _index = selectedIndex;
          });
        },
        currentIndex: _index,
        items: const [
          BottomNavigationBarItem(

              icon: Icon(Icons.map,color: Colors.black,), label: 'Restaurant Maps'),
          BottomNavigationBarItem(
              icon: Icon(Icons.fastfood,color: Colors.black), label: 'Restaurants Table',),
        ],
      ),
    );
  }
}
