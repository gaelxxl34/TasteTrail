  import 'package:flutter/material.dart';
import 'package:rolex_stands_finding/src/features/authentification/screens/signup/signu_form_widget.dart';
import 'package:rolex_stands_finding/src/features/authentification/screens/signup/signup_footer.dart';

import '../../../../common_widgets/form/form_header_widget.dart';

import '../../../../constants/image_strings.dart';
import '../../../../constants/sizes.dart';
import '../../../../constants/text_strings.dart';


class SignUpScreen extends StatelessWidget {
   const SignUpScreen({Key? key}) : super(key: key);

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
                  title: "Sign Up" ,
                  subtitle: "Screen" ,
                ),

                SignUpFormWidget(),
                SignUpFooter(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


