import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../common_widgets/form/form_header_widget.dart';
import '../../../../../constants/colors.dart';
import '../../../../../constants/image_strings.dart';
import '../../../../../constants/sizes.dart';
import '../../../../../constants/text_strings.dart';
import '../forget_password_otp/otp_screen.dart';

class ForgetPasswordMailScreen extends StatelessWidget {
  const ForgetPasswordMailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(tDefaultSize),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: tDefaultSize * 2,),
              Image(
                image: AssetImage(FpassWord1),
                height: size.height * 0.3,
              ),
              Text(
                tForgetPasswordTitle,
                style: Theme.of(context).textTheme.headline2,
              ),
              Text(
                FpasswordSubtitle,
                style: Theme.of(context).textTheme.bodyText1, textAlign: TextAlign.center,
              ),
              SizedBox(height: tDefaultSize - 10),
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email_outlined),
                  label: Text(tEmail),
                ),
              ),
              SizedBox(height: tDefaultSize - 10,),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(),
                        foregroundColor: tWhiteColor,
                        backgroundColor: tDarkColor,
                        side: BorderSide(color: tDarkColor),
                        padding: EdgeInsets.symmetric(vertical: tButtonHeight)),
                    onPressed: () {
                      //Get.to(() => OTPscreen());
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
