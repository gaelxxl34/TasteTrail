
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/sizes.dart';

class EButtonTheme{
  // light mode
  static final lightEButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(),
        foregroundColor: tDarkColor,
        backgroundColor: tWhiteColor,
        side: BorderSide(color: tDarkColor),
        padding: EdgeInsets.symmetric(vertical: tButtonHeight)
    ),
  );

  // dark mode
  static final darkEButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(),
        foregroundColor: tDarkColor,
        backgroundColor: tWhiteColor,
        side: BorderSide(color: tDarkColor),
        padding: EdgeInsets.symmetric(vertical: tButtonHeight)
    ),
  );
}