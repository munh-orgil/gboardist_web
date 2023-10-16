import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'primary_swatch.dart';

class TTextTheme {
  static TextTheme lightTheme = TextTheme(
    titleMedium: GoogleFonts.roboto(
      color: Colors.black87,
      fontSize: 14,
    ),
    // input text style
    bodyLarge: GoogleFonts.roboto(
      color: Colors.black87,
      fontSize: 14,
    ),
    // for input float
    headlineSmall: GoogleFonts.roboto(
      color: PrimarySwatch.lightColor,
      fontSize: 12,
    ),
    bodyMedium: GoogleFonts.roboto(
      color: Colors.black87,
      fontSize: 14,
    ),
    //for input label
    labelSmall: GoogleFonts.roboto(
      color: Colors.black54,
      fontSize: 14,
    ),
    //for button text
    labelMedium: GoogleFonts.roboto(
      color: Colors.white,
      fontSize: 14,
    ),
    labelLarge: GoogleFonts.roboto(
      color: Colors.black87,
      fontSize: 20,
    ),
  );
  static TextTheme darkTheme = TextTheme(
    titleMedium: GoogleFonts.roboto(
      color: Colors.white54,
      fontSize: 14,
    ),
    // input text style
    bodyLarge: GoogleFonts.roboto(
      color: Colors.white54,
      fontSize: 14,
    ),
    // for input float
    headlineSmall: GoogleFonts.roboto(
      color: PrimarySwatch.darkColor,
      fontSize: 12,
    ),
    bodyMedium: GoogleFonts.roboto(
      color: Colors.white54,
      fontSize: 14,
    ),
    //for input label
    labelSmall: GoogleFonts.roboto(
      color: Colors.white38,
      fontSize: 14,
    ),
    //for button text
    labelMedium: GoogleFonts.roboto(
      color: Colors.white54,
      fontSize: 14,
    ),
    labelLarge: GoogleFonts.roboto(
      color: Colors.white54,
      fontSize: 20,
    ),
  );
}
