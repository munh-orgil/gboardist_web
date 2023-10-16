import 'package:flutter/material.dart';

class ThemeChangerButton extends StatelessWidget {
  const ThemeChangerButton({super.key});

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    return IconButton(
      icon: Icon(
        isDarkMode ? Icons.dark_mode : Icons.light_mode,
        color: isDarkMode ? Colors.white38 : Colors.white,
      ),
      onPressed: () {},
    );
  }
}
