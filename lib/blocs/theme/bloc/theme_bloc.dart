
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:system_theme/system_theme.dart';

import 'theme_state.dart';

class ThemeBloc extends Cubit<ThemeState> {

  ThemeBloc(super.initialState);

  void toggle() => setDarkMode(!isDark);

  bool get isDark =>
      state.themeMode == ThemeMode.system
          ? SystemTheme.isDarkMode
          : state.themeMode == ThemeMode.dark;

  bool get isLight => !isDark;

  void setColor(Color color) => emit(
      state.copyWith(
        color: color,
      )
  );

  void setDarkMode(bool value) => emit(
     state.copyWith(
       themeMode: value ? ThemeMode.dark : ThemeMode.light,
     )
  );
}