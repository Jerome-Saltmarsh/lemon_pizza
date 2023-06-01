
import 'package:flutter/material.dart';

class FontSize {
  static const titleLarge = 25.0;
  static const titleMedium = 20.0;
  static const titleSmall = 15.0;
  static const labelLarge = 12.0;
  static const labelMedium = 10.0;
  static const labelSmall = 8.0;
}

class Style {
  static final dialogBorderRadius = BorderRadius.circular(4);
  static const dialogBorderWidth = 2.0;
  static const dialogPadding = EdgeInsets.all(4);

  static const themeColor = Colors.green;
  static final themeDataLight = ThemeData(colorSchemeSeed: themeColor, brightness: Brightness.light, useMaterial3: true);
  static final themeDataDark = ThemeData(colorSchemeSeed: themeColor, brightness: Brightness.dark, useMaterial3: true);
}