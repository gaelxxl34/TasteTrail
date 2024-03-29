import 'package:flutter/material.dart';

import 'catalogue_food.dart';

class CatalogBox extends StatelessWidget {
  const CatalogBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
    );
  }
}
