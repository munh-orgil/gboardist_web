import 'package:flutter/material.dart';

class TOutlinedButtonTheme {
  static OutlinedButtonThemeData lightTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      side: const BorderSide(
        width: 1,
        color: Color.fromARGB(255, 222, 222, 222),
      ),
    ),
  );
  static OutlinedButtonThemeData darkTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      side: const BorderSide(
        width: 1,
        color: Color(0x996B7280),
      ),
    ),
  );
}
