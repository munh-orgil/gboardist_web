import 'package:flutter/material.dart';

// use this class to navigate with no build context
class NavigationService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static void navigateTo(String routeName) {
    navigatorKey.currentState?.pushNamed(routeName);
  }

  static void navigateAndReplace(String routeName) {
    navigatorKey.currentState?.pushReplacementNamed(routeName);
  }

  static void navigateAndRemoveUntil(String routeName) {
    navigatorKey.currentState
        ?.pushNamedAndRemoveUntil(routeName, (Route<dynamic> route) => false);
  }
}
