
import 'package:flutter/material.dart';

class ThemeState {

  final FontSize fontSize;
  final ThemeMode themeMode;
  final Color color;
  late final ThemeData themeDataLight;
  late final ThemeData themeDataDark;

  final BorderRadius dialogBorderRadius;
  final double dialogBorderWidth;
  final EdgeInsets dialogPadding;


  bool get isLight => themeMode == ThemeMode.light;
  bool get isDark => themeMode == ThemeMode.dark;

  ThemeState({
    required this.themeMode,
    required this.color,
    required this.fontSize,
    required this.dialogBorderRadius,
    required this.dialogBorderWidth,
    required this.dialogPadding,
  }){
    themeDataLight = ThemeData(
        fontFamily: 'Niconne',
        colorSchemeSeed: color, brightness: Brightness.light, useMaterial3: true);
    themeDataDark = ThemeData(
        fontFamily: 'Niconne',
        colorSchemeSeed: color, brightness: Brightness.dark, useMaterial3: true);
  }

  ThemeState copyWith({
     ThemeMode? themeMode,
     Color? color,
     FontSize? fontSize,
     BorderRadius? dialogBorderRadius,
     double? dialogBorderWidth,
     EdgeInsets? dialogPadding,
  }) => ThemeState(
      themeMode: themeMode ?? this.themeMode,
      color: color ?? this.color,
      fontSize:  fontSize ?? this.fontSize,
      dialogBorderRadius: dialogBorderRadius ?? this.dialogBorderRadius,
      dialogBorderWidth: dialogBorderWidth ?? this.dialogBorderWidth,
      dialogPadding: dialogPadding ?? this.dialogPadding,
  );
}

class FontSize {
  final double largest;
  final double extraLarge;
  final double large;
  final double regular;
  final double small;
  final double extraSmall;

  FontSize({
    required this.largest,
    required this.extraLarge,
    required this.large,
    required this.regular,
    required this.small,
    required this.extraSmall,
  });
}