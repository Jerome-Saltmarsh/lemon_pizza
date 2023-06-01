
import 'package:flutter/material.dart';

class ThemeState {

  final FontSize fontSize;
  final ThemeMode themeMode;
  final Color color;
  late final ThemeData themeDataLight;
  late final ThemeData themeDataDark;

  bool get isLight => themeMode == ThemeMode.light;
  bool get isDark => themeMode == ThemeMode.dark;

  ThemeState({required this.themeMode, required this.color, required this.fontSize}){
    themeDataLight = ThemeData(colorSchemeSeed: color, brightness: Brightness.light, useMaterial3: true);
    themeDataDark = ThemeData(colorSchemeSeed: color, brightness: Brightness.dark, useMaterial3: true);
  }

  ThemeState copyWith({
     ThemeMode? themeMode,
     Color? color,
     FontSize? fontSize,
  }) => ThemeState(
      themeMode: themeMode ?? this.themeMode,
      color: color ?? this.color,
      fontSize:  fontSize ?? this.fontSize,
  );
}

class FontSize {
  final double extraLarge;
  final double large;
  final double regular;
  final double small;
  final double extraSmall;

  FontSize({
    required this.extraLarge,
    required this.large,
    required this.regular,
    required this.small,
    required this.extraSmall,
  });
}