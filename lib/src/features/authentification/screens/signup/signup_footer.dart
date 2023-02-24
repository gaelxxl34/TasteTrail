import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../constants/text_strings.dart';
import '../login/login_screen.dart';

class SignUpFooter extends StatelessWidget {
  const SignUpFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {
            Get.to(() => LoginScreen());
          },
          child: Text.rich(TextSpan(
            text: AlreadyHaveAcoount,
            style: Theme.of(context).textTheme.bodyText1,
            children: [
              TextSpan(
                text: tLogin.toUpperCase(),
                style: TextStyle(color: Colors.blueAccent),
              )
            ],
          )),
        )
      ],
    );;
  }
}
