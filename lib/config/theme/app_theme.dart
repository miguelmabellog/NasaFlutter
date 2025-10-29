import 'package:flutter/material.dart';

class AppTheme {
  ThemeData getTheme(BuildContext context) {
    final brightness = MediaQuery.of(context).platformBrightness;

    return ThemeData(
      colorSchemeSeed: const Color(0xFF00148C),
      brightness: brightness,
    );
  }
}
