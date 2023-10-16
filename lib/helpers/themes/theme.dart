import 'package:core_control_panel/helpers/themes/dialog_theme.theme.dart';
import 'package:core_control_panel/helpers/themes/text_selection.theme.dart';
import 'package:flutter/material.dart';
import 'circular_indicator.theme.dart';
import 'color_scheme.dart';
import 'data_table.theme.dart';
import 'page_transition.theme.dart';
import 'input.theme.dart';
import 'primary_swatch.dart';
import 'elevated_button.theme.dart';
import 'outlined_button.theme.dart';
import 'icon.theme.dart';
import 'snackbar.theme.dart';
import 'text.theme.dart';

class TTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    pageTransitionsTheme: TPageTransitionsTheme.pageTransitionsTheme,
    inputDecorationTheme: TInputTheme.lightTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.lightTheme,
    progressIndicatorTheme: TProgressIndicatorTheme.lightTheme,
    iconTheme: TIconTheme.lightTheme,
    colorScheme: TColorScheme.lightScheme,
    dialogTheme: TDialogTheme.lightTheme,
    dialogBackgroundColor: Colors.white,
    textTheme: TTextTheme.lightTheme,
    textSelectionTheme: TTextSelectionThemeData.lightTheme,
    dataTableTheme: TDataTableTheme.lightTheme,
    snackBarTheme: TSnackbarTheme.lightTheme,
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    pageTransitionsTheme: TPageTransitionsTheme.pageTransitionsTheme,
    inputDecorationTheme: TInputTheme.darkTheme,
    primarySwatch: PrimarySwatch.darkColor,
    primaryColorDark: PrimarySwatch.darkColor,
    primaryColor: PrimarySwatch.darkColor,
    elevatedButtonTheme: TElevatedButtonTheme.darkTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.darkTheme,
    progressIndicatorTheme: TProgressIndicatorTheme.darkTheme,
    iconTheme: TIconTheme.darkTheme,
    dialogTheme: TDialogTheme.darkTheme,
    textTheme: TTextTheme.darkTheme,
    textSelectionTheme: TTextSelectionThemeData.darkTheme,
    dataTableTheme: TDataTableTheme.darkTheme,
    snackBarTheme: TSnackbarTheme.darkTheme,
  );
}
