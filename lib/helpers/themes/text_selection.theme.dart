import 'package:core_control_panel/helpers/themes/primary_swatch.dart';
import 'package:flutter/material.dart';

class TTextSelectionThemeData {
  static TextSelectionThemeData lightTheme = TextSelectionThemeData(
    selectionColor: PrimarySwatch.lightColor,
    selectionHandleColor: Colors.white,
  );
  static TextSelectionThemeData darkTheme = TextSelectionThemeData(
    selectionColor: PrimarySwatch.darkColor,
    selectionHandleColor: Colors.white,
  );
}
