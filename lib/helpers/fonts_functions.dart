import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle kzillaSlab(
        {FontWeight? fontWeight, double? fontSize, Color? color}) =>
    GoogleFonts.zillaSlab(
      color: color ?? Colors.black,
      fontSize: fontSize,
      fontWeight: fontWeight,
    );

TextStyle kroboto({FontWeight? fontWeight, double? fontSize, Color? color}) {
  return GoogleFonts.roboto(
      fontWeight: fontWeight, fontSize: fontSize, color: color);
}

TextStyle kibmPlexSansArabic(
    {FontWeight? fontWeight,
    double? fontSize,
    Color? color,
    double? leterSpacing}) {
  return GoogleFonts.ibmPlexSansArabic(
      letterSpacing: leterSpacing,
      fontWeight: fontWeight,
      fontSize: fontSize,
      color: color);
}

TextStyle kmukta({FontWeight? fontWeight, double? fontSize, Color? color}) {
  return GoogleFonts.mukta(
      fontWeight: fontWeight, fontSize: fontSize, color: color);
}

TextStyle krubik({FontWeight? fontWeight, double? fontSize, Color? color}) {
  return GoogleFonts.rubik(
      fontWeight: fontWeight, fontSize: fontSize, color: color);
}
