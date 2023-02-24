import 'package:flutter/material.dart';

import '../../../../common_widgets/form/form_header_widget.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/image_strings.dart';
import '../../../../constants/sizes.dart';
import '../../../../constants/text_strings.dart';
import '../signup/signu_form_widget.dart';
import '../signup/signup_footer.dart';
import 'Login_Header_Widget.dart';
import 'login-form.dart';
import 'login_footer_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FormHeaderWidget(
                  image: tryi,
                  title: "login",
                  subtitle: "screen",
                ),
                const tryii(),
                LoginFooterWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


