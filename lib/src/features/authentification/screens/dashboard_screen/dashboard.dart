import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:rolex_stands_finding/src/features/authentification/screens/dashboard_screen/widgets/catalogue_food.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/image_strings.dart';
import '../../../../constants/text_strings.dart';
import '../../../../repository/authentification_repository/authentification_repository.dart';
import '../../controllers/user_details_controller.dart';
import '../../models/user_model.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

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
                SizedBox(
                  height: 25,
                ),

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
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
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
                SizedBox(
                  height: 9,
                ),

                Container(
                  padding: EdgeInsets.all(10),
                  width: double.infinity,
                  height: 130,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(photoHome),
                      fit: BoxFit.cover
                    ),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),

                      boxShadow: [
                        BoxShadow(
                          blurRadius: 2.0,
                        )
                      ]),
                 // child: const Text("Find the nearest stand or local food and get natural food for breakfast, launch or dinner enjoy, Eat Bio!"),
                ),
                SizedBox(
                  height: 30,
                ),

                Text(
                  'Catalogues',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),

                SizedBox(
                  height: 220,
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: [
                      catalogue(
                        image:
                            "https://img.freepik.com/free-photo/high-angle-table-full-delicious-food-arrangement_23-2149141347.jpg",
                        text1: 'Hotel International',
                        text2: 'Breakfast, Lunch,Super',
                      ),
                      catalogue(
                        image:
                            "https://img.freepik.com/free-photo/flat-lay-composition-different-foods_23-2148826857.jpg",
                        text1: 'Shawarma Delight',
                        text2: 'Sandwiches, soft Drinks',
                      ),
                      catalogue(
                        image:
                            "https://as2.ftcdn.net/v2/jpg/05/58/80/51/1000_F_558805197_hAZprxbTr47BJK92yJ0LZ6QYbKualHqn.jpg",
                        text1: 'Dairy Treat',
                        text2: 'Breakfast,grabs',
                      ),
                      catalogue(
                        image:
                            "https://as2.ftcdn.net/v2/jpg/03/33/56/17/1000_F_333561737_z8poViL5VhB2qUgnHERr93leyQphMMpB.jpg",
                        text1: 'First Kiss Chef',
                        text2: 'Fastfood, lunch',
                      ),
                      catalogue(
                        image:
                            "https://as2.ftcdn.net/v2/jpg/05/37/86/39/1000_F_537863945_FTk780Pvm2S0EKC7qG68KIjbeBlVqq43.jpg",
                        text1: 'Hotel Afros',
                        text2: 'Lunch, Breakfast',
                      ),
                      catalogue(
                          image:
                              "https://as1.ftcdn.net/v2/jpg/05/65/33/40/1000_F_565334078_opRHu9aaCermkDmC7p3coLJVSgrTIeD1.jpg",
                          text1: 'text1',
                          text2: 'text2'),
                      catalogue(
                          image:
                              "https://as2.ftcdn.net/v2/jpg/00/59/33/75/1000_F_59337550_UZQ4X6wGvGSTnLPuTu2X3ifBqSv0MR2h.jpg",
                          text1: "text1",
                          text2: "text2"),
                      catalogue(
                          image:
                              "https://as1.ftcdn.net/v2/jpg/00/92/76/76/1000_F_92767628_Q18SlocFzWxoAUSDDWwuVxStrChEyaJF.jpg",
                          text1: "text1",
                          text2: "text2"),
                      catalogue(
                          image:
                              "https://as2.ftcdn.net/v2/jpg/02/23/15/25/1000_F_223152587_GtGRTp3tMFwp8eB2tV2xi7K6uXxQosXv.jpg",
                          text1: "text1",
                          text2: "text2"),
                      catalogue(
                          image:
                              "https://as2.ftcdn.net/v2/jpg/02/29/15/65/1000_F_229156511_stgCLK8cTT4ygmVVAUqnzqeVtEqq7mWq.jpg",
                          text1: "text1",
                          text2: "text2"),
                      catalogue(
                          image:
                              "https://as1.ftcdn.net/v2/jpg/05/61/93/12/1000_F_561931244_pZPdEjD8NUkevsYdQYGOupjgxQrjfXyx.jpg",
                          text1: "text1",
                          text2: "text2"),
                      catalogue(
                          image:
                              "https://as1.ftcdn.net/v2/jpg/02/24/36/02/1000_F_224360288_yHJEAvIQa1Y8ARUC3dHBBGJBseJuW8gK.jpg",
                          text1: "text1",
                          text2: "text2"),
                      catalogue(
                          image:
                              "https://as2.ftcdn.net/v2/jpg/05/66/86/91/1000_F_566869138_7zak19bKj9Lii8w2FJPcBJQw6WnqV9e9.jpg",
                          text1: "text1",
                          text2: "text2"),
                      catalogue(
                          image:
                              "https://as2.ftcdn.net/v2/jpg/05/64/10/71/1000_F_564107178_fvIGq6frkIQCYGpmvweN1y2totUXcNAr.jpg",
                          text1: "text1",
                          text2: "text2")
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                ),

                Text(
                  'Our Services',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 120,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
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
                              Icon(Icons.location_on),
                              Text("Find")
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
                              Icon(LineAwesomeIcons.list_ul, ),
                              Text("Order")
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
