import 'package:flutter/material.dart';
import 'package:rolex_stands_finding/src/constants/colors.dart';

Widget rideDetails(BuildContext context, String stationName, String distance,
    int stationCount) {
  return Positioned(
    bottom: 0,
    child: SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: ListTile(
            leading: const Image(
                image: AssetImage('assets/icon/food.png'),
                height: 50,
                width: 50),
            title: Text(stationName,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            // subtitle:  Text(
            //   '${distance} kms away',
            //   style: Theme.of(context)
            //       .textTheme
            //       .bodySmall
            //       ?.copyWith(color: Colors.red),
            // ),
            trailing: ElevatedButton(
              style: ElevatedButton.styleFrom(
                 backgroundColor: tRed
              ),
              onPressed: () {},
              child: Text('$stationCount slots',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18)),
            ),
          ),
        ),
      ),
    ),
  );
}
