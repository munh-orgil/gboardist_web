import 'package:core_control_panel/helpers/themes/primary_swatch.dart';
import 'package:flutter/material.dart';

class TDataTableTheme {
  static DataTableThemeData lightTheme = DataTableThemeData(
    dataRowMinHeight: 16 * 2,
    decoration: BoxDecoration(
      boxShadow: const [
        BoxShadow(
          color: Colors.transparent,
        ),
      ],
      border: Border.all(
        color: Colors.blueGrey.shade100,
        width: 1,
      ),
    ),
  );
  static DataTableThemeData darkTheme = DataTableThemeData(
    dataRowMinHeight: 16 * 2,
    decoration: BoxDecoration(
      boxShadow: const [
        BoxShadow(
          color: Colors.transparent,
        ),
      ],
      border: Border.all(
        color: PrimarySwatch.darkColor.shade300,
        width: 1,
      ),
    ),
  );
}
