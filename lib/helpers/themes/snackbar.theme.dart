import 'package:flutter/material.dart';
import 'text.theme.dart';

class TSnackbarTheme {
  static SnackBarThemeData lightTheme = SnackBarThemeData(
    elevation: 8,
    contentTextStyle: TTextTheme.lightTheme.labelMedium,
    backgroundColor: const Color(0xFF1a1a1a),
  );
  static SnackBarThemeData darkTheme = SnackBarThemeData(
    elevation: 8,
    contentTextStyle: TTextTheme.lightTheme.labelMedium,
    backgroundColor: const Color(0xFF2d2d2d),
  );
}
