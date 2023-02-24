



import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/sizes.dart';

class TOutlinedButtonTheme{
  TOutlinedButtonTheme._();

  // light mode
  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(),
        foregroundColor: tDarkColor,
        side: BorderSide(color: tDarkColor),
        padding: EdgeInsets.symmetric(vertical: tButtonHeight)
    ),
  );

  // dark mode
  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(),
        foregroundColor: tWhiteColor,
        backgroundColor: tDarkColor,
        side: BorderSide(color: tDarkColor),
        padding: EdgeInsets.symmetric(vertical: tButtonHeight)
    ),
  );

}