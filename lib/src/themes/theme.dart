
import 'package:flutter/material.dart';
import 'package:rolex_stands_finding/src/themes/widgets_themes/elevated_button.dart';
import 'package:rolex_stands_finding/src/themes/widgets_themes/outlined_button.dart';
import 'package:rolex_stands_finding/src/themes/widgets_themes/text_field_theme.dart';
import 'package:rolex_stands_finding/src/themes/widgets_themes/text_theme.dart';




class GaelTheme {
  GaelTheme._();

  static ThemeData lighttheme = ThemeData(
      brightness: Brightness.light,
      textTheme: GtextTheme.lightTextTheme,
    // outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme
      inputDecorationTheme: TTextFormFieldThme.lightInputDecorationTheme

  );
  static ThemeData darktheme = ThemeData(
      brightness: Brightness.dark,
      textTheme: GtextTheme.darkTextTheme,
      outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme,
    elevatedButtonTheme: EButtonTheme.darkEButtonTheme,
      inputDecorationTheme: TTextFormFieldThme.darkInputDecorationTheme
  );
}
