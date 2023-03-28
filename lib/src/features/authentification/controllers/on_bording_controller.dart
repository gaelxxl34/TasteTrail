

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:liquid_swipe/PageHelpers/LiquidController.dart';

import '../../../constants/colors.dart';
import '../../../constants/image_strings.dart';
import '../../../constants/text_strings.dart';
import '../models/model_on_boarding.dart';
import '../screens/on_bording/on_bording_page_widget.dart';


class OnBordingController extends GetxController{
  final controller = LiquidController();
  RxInt currentPage = 0.obs;

  final pages = [
    OnBoradingPageWidget(

      model: OnBordingModel(
          image: OnbordingImage1,
          title: OnboardTitle1,
          subTitle: OnboardSubitle1,
          counterText: Onboardounter1,
          bgcolor: onboardColor1,
        textColor: Colors.white,


      ),
    ),
    OnBoradingPageWidget(
      model: OnBordingModel(
          image: OnbordingImage2,
          title: OnboardTitle2,
          subTitle: OnboardSubitle2,
          counterText: Onboardounter2,
          bgcolor: onboardColor2,
        textColor: Colors.white,
      ),
    ),
    OnBoradingPageWidget2(
      model: OnBordingModel(
          image: OnbordingImage3,
          title: OnboardTitle3,
          subTitle: OnboardSubitle3,
          counterText: Onboardounter3,
          bgcolor: onboardColor3,
        textColor: Colors.white,
      ),
    ),
  ];

}