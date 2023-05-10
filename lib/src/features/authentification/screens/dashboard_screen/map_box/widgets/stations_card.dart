import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../../constants/colors.dart';



class StationsCard extends StatefulWidget {
  final String name, distance, imageUrl;
  final bool isSelected;

  const StationsCard(
      {Key? key,
      required this.name,
      required this.distance,
      required this.isSelected,
      required this.imageUrl})
      : super(key: key);

  @override
  State<StationsCard> createState() => _StationsCardState();
}

class _StationsCardState extends State<StationsCard> {
  Widget cardButtons(IconData iconData, String label) {


    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(5),
          minimumSize: Size.zero,
        ),
        child: Row(
          children: [
            Icon(iconData, size: 16),
            const SizedBox(width: 2),
            Text(label)
          ],
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    final String _phoneNumber = "+256726455053";

    return SingleChildScrollView(
      child: SizedBox(
        width: 300,
        height: 260,
        child: Padding(
          padding: const EdgeInsets.only(right: 10, top: 0),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CachedNetworkImage(
                  imageUrl: widget.imageUrl,
                  height: 145,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 5),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(widget.name,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(color: Colors.black)),

                      Text('Closes at 10PM'),
                    Text(
                      '${widget.distance} kms away',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: Colors.red),
                    ),
                    ElevatedButton(
                      onPressed: () async{
                        final Uri _phone = Uri.parse('tel:$_phoneNumber');
                        if (!await launchUrl(_phone)) {
                          throw Exception('Could not launch $_phone');
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                        minimumSize: Size.zero,
                        backgroundColor: tRed
                      ), child: Text("Call"),
                      
                    ),
                  ],
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
