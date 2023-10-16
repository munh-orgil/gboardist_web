import 'package:core_control_panel/helpers/themes/primary_swatch.dart';
import 'package:flutter/material.dart';

class TColorScheme {
  static ColorScheme lightScheme = ColorScheme.light(
    primary: PrimarySwatch.lightColor.shade500,
    secondary: Colors.yellow,
    background: Colors.white,
    surfaceTint: Colors.white,
    outlineVariant: Colors.grey.shade200,
  );
  static ColorScheme darkScheme = ColorScheme.dark(
    primary: PrimarySwatch.darkColor.shade500,
    secondary: Colors.green,
    background: Colors.grey,
    surfaceTint: Colors.grey,
    outlineVariant: Colors.grey.shade800,
  );
}
