
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:system_theme/system_theme.dart';

class ThemeBloc extends Cubit<ThemeMode> {

  ThemeBloc() : super(ThemeMode.system);

  void toggle() => emit(isDark ? ThemeMode.light : ThemeMode.dark);

  bool get isDark =>
      state == ThemeMode.system
          ? SystemTheme.isDarkMode
          : state == ThemeMode.dark;

  bool get isLight => !isDark;

  void setDarkMode(bool value) => emit(value ? ThemeMode.dark : ThemeMode.light);
}