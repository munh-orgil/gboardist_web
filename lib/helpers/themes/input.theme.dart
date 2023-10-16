import 'package:core_control_panel/helpers/themes/text.theme.dart';
import 'package:flutter/material.dart';

class TInputTheme {
  static InputDecorationTheme lightTheme = InputDecorationTheme(
    border: const OutlineInputBorder(
      borderSide: BorderSide(width: 1, color: Colors.black12),
    ),
    enabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(width: 1, color: Colors.black12),
    ),
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(width: 1, color: Colors.black12),
    ),
    disabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(width: 1, color: Colors.black12),
    ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
    fillColor: const Color.fromARGB(255, 234, 234, 234),
    suffixIconColor: Colors.black87,
    labelStyle: TTextTheme.lightTheme.labelSmall,
    floatingLabelStyle: TTextTheme.lightTheme.headlineSmall,
  );
  static InputDecorationTheme darkTheme = InputDecorationTheme(
    border: const OutlineInputBorder(
      borderSide: BorderSide(width: 1, color: Colors.white12),
    ),
    enabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(width: 1, color: Colors.white12),
    ),
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(width: 1, color: Colors.white12),
    ),
    disabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(width: 1, color: Colors.white12),
    ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
    fillColor: const Color.fromARGB(255, 100, 100, 100),
    suffixIconColor: Colors.white60,
    labelStyle: TTextTheme.darkTheme.labelSmall,
    floatingLabelStyle: TTextTheme.darkTheme.headlineSmall,
  );
}
