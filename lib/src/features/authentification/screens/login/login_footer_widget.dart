
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/image_strings.dart';
import '../../../../constants/sizes.dart';
import '../../../../constants/text_strings.dart';
import '../signup/signup_screnn.dart';

class LoginFooterWidget extends StatelessWidget {
  const LoginFooterWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {
            Get.to(() => SignUpScreen());
          },
          child: Text.rich(TextSpan(
            text: DontHaveAcoount,
            style: Theme.of(context).textTheme.bodyText1,
            children: [
              TextSpan(
                text: tSignup.toUpperCase(),
                style: TextStyle(color: Colors.blueAccent),
              )
            ],
          )),
        )
      ],
    );
  }
}