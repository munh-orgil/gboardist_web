import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

class TPageTransitionsTheme {
  static PageTransitionsTheme pageTransitionsTheme = PageTransitionsTheme(
    builders: kIsWeb
        ? {
            // No animations for every OS if the app running on the web
            for (final platform in TargetPlatform.values)
              platform: const NoTransitionsBuilder(),
          }
        : const {
            // handel other platforms you are targeting
          },
  );
}

class NoTransitionsBuilder extends PageTransitionsBuilder {
  const NoTransitionsBuilder();

  @override
  Widget buildTransitions<T>(
    PageRoute<T>? route,
    BuildContext? context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget? child,
  ) {
    return child!;
  }
}
