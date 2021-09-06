import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final Color primaryColor = Color(0xffCED9FF);
final Color secondColor = Color(0xffF5F3FE);
final Color ratingColor = Color(0xffFBC02D);
final Color thirdColor = Color(0xff3F51B5);
final Color dangerColor = Color(0xffFF7272);

final TextTheme textThemeApp = TextTheme(
  headline1: GoogleFonts.lora(
      fontSize: 92, fontWeight: FontWeight.w300, letterSpacing: -1.5),
  headline2: GoogleFonts.lora(
      fontSize: 57, fontWeight: FontWeight.w300, letterSpacing: -0.5),
  headline3: GoogleFonts.lora(fontSize: 46, fontWeight: FontWeight.w400),
  headline4: GoogleFonts.lora(
    fontSize: 32,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
  ),
  headline5: GoogleFonts.lora(fontSize: 23, fontWeight: FontWeight.w400),
  headline6: GoogleFonts.lora(
      fontSize: 19, fontWeight: FontWeight.w500, letterSpacing: 0.15),
  subtitle1: GoogleFonts.lora(
      fontSize: 15, fontWeight: FontWeight.w400, letterSpacing: 0.15),
  subtitle2: GoogleFonts.lora(
      fontSize: 13, fontWeight: FontWeight.w500, letterSpacing: 0.1),
  bodyText1: GoogleFonts.lora(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
  ),
  bodyText2: GoogleFonts.lora(
      fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25),
  button: GoogleFonts.lora(
      fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 1.25),
  caption: GoogleFonts.lora(
      fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4),
  overline: GoogleFonts.lora(
      fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5),
);
