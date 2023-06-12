
import 'package:flutter/material.dart';

class ThemeState {

  final Duration animationDuration;
  final FontSize fontSize;
  final ThemeMode themeMode;
  final Color color;
  late final ThemeData themeDataLight;
  late final ThemeData themeDataDark;

  final BorderRadius dialogBorderRadius;
  final double dialogBorderWidth;
  final EdgeInsets dialogPadding;

  late final buttonStyleShape = MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: dialogBorderRadius, // Set the border radius here
    ),
  );


  bool get isLight => themeMode == ThemeMode.light;
  bool get isDark => themeMode == ThemeMode.dark;

  ThemeState({
    required this.themeMode,
    required this.color,
    required this.fontSize,
    required this.dialogBorderRadius,
    required this.dialogBorderWidth,
    required this.dialogPadding,
    required this.animationDuration,
  }){

    final textButtonTheme = TextButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: dialogBorderRadius, // Set the border radius here
          ),
        ),
      ),
    );

    themeDataLight = ThemeData(
        fontFamily: 'Niconne',
        textButtonTheme: textButtonTheme,
        colorSchemeSeed: color, brightness: Brightness.light, useMaterial3: true);
    themeDataDark = ThemeData(
        fontFamily: 'Niconne',
        textButtonTheme: textButtonTheme,
        colorSchemeSeed: color, brightness: Brightness.dark, useMaterial3: true);
  }

  ThemeState copyWith({
     ThemeMode? themeMode,
     Color? color,
     FontSize? fontSize,
     BorderRadius? dialogBorderRadius,
     double? dialogBorderWidth,
     EdgeInsets? dialogPadding,
     Duration? animationDuration,
  }) => ThemeState(
      animationDuration: animationDuration ?? this.animationDuration,
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