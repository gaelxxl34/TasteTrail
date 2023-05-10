import 'package:flutter/material.dart';

import '../../../../../constants/image_strings.dart';
import '../../../../../repository/authentification_repository/authentification_repository.dart';
import '../map_box/widgets/catalog.dart';
import '../widgets/catalog_box.dart';
import '../widgets/catalogue_food.dart';

class OurRestaurants extends StatelessWidget {
  const OurRestaurants({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          ".Our Restaurants",
          style: Theme.of(context).textTheme.headline4,
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              SizedBox(
                height: 230,
                child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: [
                      CatalogueFood(
                        image:
                        'https://raw.githubusercontent.com/gaelxxl34/E-commerce-Images/main/photo_2_2023-04-27_13-01-54.jpg',
                        text1: 'Geya Restaurants',
                        text2: 'Local food, lunch,super',
                      ),
                      CatalogueFood(
                        image:
                        'https://raw.githubusercontent.com/gaelxxl34/E-commerce-Images/main/photo_2_2023-04-27_13-01-54.jpg',
                        text1: 'Geya Restaurants',
                        text2: 'Local food, lunch,super',
                      ),
                    ]
                ),
              ),
              SizedBox(
                height: 230,
                child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: [
                      CatalogueFood(
                        image:
                        'https://raw.githubusercontent.com/gaelxxl34/E-commerce-Images/main/photo_1_2023-04-27_13-01-54.jpg',
                        text1: 'CHOGM PORK JOINT',
                        text2: 'Pork Special, lunch,super',
                      ),
                      CatalogueFood(
                        image:
                        'https://raw.githubusercontent.com/gaelxxl34/E-commerce-Images/main/photo_1_2023-04-27_13-01-54.jpg',
                        text1: 'CHOGM PORK JOINT',
                        text2: 'Pork Special, lunch,super',
                      ),
                    ]
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
