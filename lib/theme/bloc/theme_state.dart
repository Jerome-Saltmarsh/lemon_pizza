
import 'package:flutter/material.dart';

class ThemeState {
  final ThemeMode themeMode;
  final Color color;
  late final ThemeData themeDataLight;
  late final ThemeData themeDataDark;

  bool get isLight => themeMode == ThemeMode.light;
  bool get isDark => themeMode == ThemeMode.dark;

  ThemeState({required this.themeMode, required this.color}){
    themeDataLight = ThemeData(colorSchemeSeed: color, brightness: Brightness.light, useMaterial3: true);
    themeDataDark = ThemeData(colorSchemeSeed: color, brightness: Brightness.dark, useMaterial3: true);
  }

  ThemeState copyWith({
     ThemeMode? themeMode,
     Color? color,
  }) => ThemeState(themeMode: themeMode ?? this.themeMode, color: color ?? this.color);
}