import 'package:flutter/material.dart';
class catalogue extends StatelessWidget {
  catalogue({
    Key? key,
    required this.text3,
    required this.text1,
    required this.text2
  }) : super(key: key);

  String text3, text1, text2;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 360,
      height: 220,
      child: Padding(
        padding: const EdgeInsets.only(right: 10, top: 5),
        child: Container(

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 145,
                child: Container(
                  color: Colors.red,
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