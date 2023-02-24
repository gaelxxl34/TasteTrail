
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rolex_stands_finding/src/features/authentification/models/user_model.dart';

import '../../../../../constants/colors.dart';
import '../../../../../constants/image_strings.dart';
import '../../../../../constants/sizes.dart';
import '../../../../../constants/text_strings.dart';
import '../../../../../repository/authentification_repository/authentification_repository.dart';
import '../../../controllers/otp_controller.dart';
import '../../../controllers/user_details_controller.dart';

class OTPscreen extends StatelessWidget {
  const OTPscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var otp;

    var otpController = Get.put(OTPController());
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(tDefaultSize),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage(tryi),
                height: size.height * 0.3,
              ),
              Text(otpSubtitle, style: Theme.of(context).textTheme.headline4,),
              SizedBox(height: 40.0,),
              Text(otpMessage  , textAlign: TextAlign.center,),

              SizedBox(height: 20.0,),
              OtpTextField(
                numberOfFields: 6,
                fillColor: Colors.black.withOpacity(0.1),
                filled: true,
                onSubmit: (code){
                  otp = code;
                  OTPController.instance.verifyOTP(otp);
                },
              ),
              const SizedBox(height: 50),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                        foregroundColor: tWhiteColor,
                        backgroundColor: tRed,
                        padding: EdgeInsets.symmetric(vertical: 18)
                    ),
                    onPressed: () {
                      OTPController.instance.verifyOTP(otp);
                    },
                    child: Text(
                      tNext.toUpperCase(),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
