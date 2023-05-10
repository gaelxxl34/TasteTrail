import 'package:flutter/material.dart';

class CatalogueFood extends StatelessWidget {
  CatalogueFood({
    Key? key,
    required this.image,
    required this.text1,
    required this.text2
  }) : super(key: key);

  String image, text1, text2;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 360,
      height: 230,
      child: Padding(
        padding: const EdgeInsets.only(right: 10, top: 5),
        child: Container(

          //padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 155,
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(image),
                          fit: BoxFit.cover)),
                ),
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [
                      Text(
                        text1,
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        text2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}