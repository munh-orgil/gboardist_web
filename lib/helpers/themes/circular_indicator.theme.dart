import 'package:flutter/material.dart';
import 'primary_swatch.dart';

class TProgressIndicatorTheme {
  static ProgressIndicatorThemeData lightTheme = ProgressIndicatorThemeData(
    color: PrimarySwatch.lightColor,
    linearMinHeight: 2,
  );
  static ProgressIndicatorThemeData darkTheme = ProgressIndicatorThemeData(
    color: PrimarySwatch.darkColor,
    linearMinHeight: 2,
  );
}
