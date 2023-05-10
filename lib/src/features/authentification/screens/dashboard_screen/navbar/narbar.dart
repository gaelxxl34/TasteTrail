import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../constants/colors.dart';
import '../dashboard.dart';
import '../pages/my_account.dart';
import '../pages/Restaurants.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedTab = 1;
  late User? firebaseUser;

  final List<Widget> _pages = [OurRestaurants(), Dashboard(), MyAccount()];

  late Future<User?> _userFuture;

  @override
  void initState() {
    super.initState();
    _userFuture = FirebaseAuth.instance.authStateChanges().first;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<User?>(
      future: _userFuture,
      builder: (context, snapshot) {
        firebaseUser = snapshot.data;
        return Scaffold(
          body: _pages[_selectedTab],
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.4),
                    spreadRadius: 0,
                    blurRadius: 10),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              child: BottomNavigationBar(
                backgroundColor: Colors.white,
                selectedItemColor: tRed,
                unselectedItemColor: tSecondaryColor,
                selectedFontSize: 12,
                unselectedFontSize: 12,
                type: BottomNavigationBarType.fixed,
                currentIndex: _selectedTab,
                onTap: (index) {
                  setState(() {
                    _selectedTab = index;
                  });
                },
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.list_alt),
                    label: 'Restaurants',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.search),
                    label: 'Search',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: 'My account',
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}