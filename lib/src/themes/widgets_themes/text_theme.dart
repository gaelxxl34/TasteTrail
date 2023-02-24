import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/colors.dart';


class GtextTheme {
  GtextTheme._();

  static TextTheme lightTextTheme = TextTheme(
    headline1: GoogleFonts.montserrat(fontSize: 28, color: tDarkColor, fontWeight: FontWeight.bold),
    headline2: GoogleFonts.montserrat(fontSize: 24, color: tDarkColor, fontWeight: FontWeight.w700),
    headline3: GoogleFonts.poppins(fontSize: 24, color: tDarkColor, fontWeight: FontWeight.w700),
    headline4: GoogleFonts.poppins(fontSize: 16, color: tDarkColor, fontWeight: FontWeight.w600),
    headline5: GoogleFonts.poppins(fontSize: 14, color: tDarkColor, fontWeight: FontWeight.w600),
    headline6: GoogleFonts.poppins(fontSize: 14, color: tDarkColor, fontWeight: FontWeight.w600),
    bodyText1: GoogleFonts.poppins(fontSize: 14, color: tDarkColor, fontWeight: FontWeight.normal),
    bodyText2: GoogleFonts.poppins(fontSize: 14, color: tDarkColor, fontWeight: FontWeight.normal),

  );
  static TextTheme darkTextTheme = TextTheme(
    headline1: GoogleFonts.montserrat(fontSize: 28, color: tWhiteColor, fontWeight: FontWeight.bold),
    headline2: GoogleFonts.montserrat(fontSize: 24, color: tWhiteColor, fontWeight: FontWeight.w700),
    headline3: GoogleFonts.poppins(fontSize: 24, color: tWhiteColor, fontWeight: FontWeight.w700),
    headline4: GoogleFonts.poppins(fontSize: 16, color: tWhiteColor, fontWeight: FontWeight.w600),
    headline5: GoogleFonts.poppins(fontSize: 14, color: tWhiteColor, fontWeight: FontWeight.w600),
    headline6: GoogleFonts.poppins(fontSize: 14, color: tWhiteColor, fontWeight: FontWeight.w600),
    bodyText1: GoogleFonts.poppins(fontSize: 14, color: tWhiteColor, fontWeight: FontWeight.normal),
    bodyText2: GoogleFonts.poppins(fontSize: 14, color: tWhiteColor, fontWeight: FontWeight.normal),

  );
}
