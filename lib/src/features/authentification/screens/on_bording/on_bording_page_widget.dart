import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/sizes.dart';

import '../../models/model_on_boarding.dart';
import '../dashboard_screen/navbar/narbar.dart';

class OnBoradingPageWidget extends StatelessWidget {
  const OnBoradingPageWidget({
    Key? key,
    required this.model,
  }) : super(key: key);

  final OnBordingModel model;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(tDefaultSize),
      color: model.bgcolor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: [
          Image(image: AssetImage(model.image), height: size.height * 0.3),
          Column(
            children: [
              Text(
                model.title,
                style: TextStyle(color: Colors.white, fontSize: 21, fontWeight: FontWeight.bold),
              ),
              Text(
                model.subTitle,
                textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 19, )
              ),
            ],
          ),
          Text(model.counterText, style: TextStyle(color: Colors.white, fontSize: 19)),
          SizedBox(
            height: 50.0,
          )
        ],
      ),
    );
  }
}


class OnBoradingPageWidget2 extends StatelessWidget {
  const OnBoradingPageWidget2({
    Key? key,
    required this.model,
  }) : super(key: key);

  final OnBordingModel model;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(tDefaultSize),
      color: model.bgcolor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: [
          Image(image: AssetImage(model.image), height: size.height * 0.2),
          Column(
            children: [
              Text(
                model.title,
                style: TextStyle(color: Colors.white, fontSize: 21, fontWeight: FontWeight.bold),
              ),
              Text(
                  model.subTitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 19, )
              ),
            ],
          ),
          SizedBox(
              width: 200,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    foregroundColor: tWhiteColor,
                    backgroundColor: Colors.black,
                    padding: EdgeInsets.symmetric(vertical: 8)
                ),
                onPressed: () {
                  Get.to(()=> Home());
                } ,
                child: Text(
                  "Start now  ".toUpperCase() + model.counterText, style: TextStyle(fontSize: 16),
                ),
              )),
          SizedBox(
            height: 30.0,
          )
        ],
      ),
    );
  }
}