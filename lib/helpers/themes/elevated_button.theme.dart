import 'package:flutter/material.dart';
import 'primary_swatch.dart';

class TElevatedButtonTheme {
  static ElevatedButtonThemeData lightTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      shadowColor: Colors.transparent,
      side: const BorderSide(color: Colors.transparent),
      backgroundColor: PrimarySwatch.lightColor,
      textStyle: const TextStyle(color: Colors.white),
    ),
  );
  static ElevatedButtonThemeData darkTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      shadowColor: Colors.transparent,
      side: const BorderSide(color: Colors.transparent),
      backgroundColor: PrimarySwatch.darkColor.shade700,
      textStyle: TextStyle(color: PrimarySwatch.darkColor.shade500),
    ),
  );
}
