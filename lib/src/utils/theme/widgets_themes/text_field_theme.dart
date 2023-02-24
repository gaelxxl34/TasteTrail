import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

class TTextFormFieldThme {
  TTextFormFieldThme._();

  static InputDecorationTheme lightInputDecorationTheme =
      const InputDecorationTheme(
    prefixIconColor: tDarkColor,
    floatingLabelStyle: TextStyle(color: tDarkColor),
    border: OutlineInputBorder(),
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
      width: 2.0,
      color: onboardColor1,
    )),
  );

  static InputDecorationTheme darkInputDecorationTheme =
      const InputDecorationTheme(
    prefixIconColor: onboardColor1,
    floatingLabelStyle: TextStyle(color: onboardColor1),
    border: OutlineInputBorder(),
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
      width: 2.0,
      color: onboardColor1,
    )),
  );
}
