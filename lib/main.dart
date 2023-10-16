import 'package:flutter/material.dart';
import 'package:core_control_panel/helpers/themes/theme.dart';
import 'package:core_control_panel/routes/routes.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_web_plugins/url_strategy.dart';

void main() async {
  usePathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static final ValueNotifier<ThemeMode> themenotifier =
      ValueNotifier(ThemeMode.light);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themenotifier,
      builder: (_, ThemeMode mode, __) {
        return MaterialApp(
          title: "GBoardist",
          initialRoute: '/login',
          routes: routes,
          debugShowCheckedModeBanner: false,
          theme: TTheme.lightTheme,
          darkTheme: TTheme.darkTheme,
          themeMode: mode,
        );
      },
    );
  }
}
