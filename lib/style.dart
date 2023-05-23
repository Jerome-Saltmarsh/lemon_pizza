
import 'package:flutter/material.dart';

class FontSize {
  static const titleLarge = 25.0;
  static const titleMedium = 20.0;
  static const titleSmall = 15.0;
}

class Style {
  static const color = Colors.green;
  static final colorSchemeLight = ColorScheme.fromSeed(seedColor: color, brightness: Brightness.dark);
  static final colorSchemeDark = ColorScheme.fromSeed(seedColor: color, brightness: Brightness.light);

  static final themeDataLight = ThemeData().copyWith(
    useMaterial3: true,
    colorScheme: colorSchemeLight,
    appBarTheme: const AppBarTheme().copyWith(
      backgroundColor: colorSchemeLight.onPrimaryContainer,
      foregroundColor: colorSchemeLight.primaryContainer,
      centerTitle: true,
    ),
    textTheme: ThemeData().textTheme.copyWith(
      titleLarge: const TextStyle(color: Colors.black, fontSize: FontSize.titleLarge),
      titleMedium: const TextStyle(color: Colors.black, fontSize: FontSize.titleMedium),
      titleSmall: const TextStyle(color: Colors.black, fontSize: FontSize.titleSmall),
    ),
  );

  static final themeDataDark = ThemeData().copyWith(
    useMaterial3: true,
    colorScheme: colorSchemeDark,
    scaffoldBackgroundColor: colorSchemeDark.primary,
    appBarTheme: const AppBarTheme().copyWith(
      backgroundColor: colorSchemeDark.onPrimaryContainer,
      foregroundColor: colorSchemeDark.primaryContainer,
      centerTitle: true,
    ),
    textTheme: ThemeData().textTheme.copyWith(
      titleLarge: const TextStyle(color: Colors.white, fontSize: FontSize.titleLarge),
      titleMedium: const TextStyle(color: Colors.white, fontSize: FontSize.titleMedium),
      titleSmall: const TextStyle(color: Colors.white, fontSize: FontSize.titleSmall),
    ),
  );
}