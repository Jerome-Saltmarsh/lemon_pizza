
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lemon_pizza/theme/bloc/theme_bloc.dart';

class ThemeModeToggle extends StatelessWidget {
  const ThemeModeToggle({super.key});

  @override
  Widget build(BuildContext context) {
    final themeBloc = context.watch<ThemeBloc>();
    return Row(
      children: [
        Text(themeBloc.isDark ? 'DARK' : "LIGHT"),
        const SizedBox(width: 8),
        Switch(
          value: themeBloc.isDark,
          onChanged: themeBloc.setDarkMode,
        ),
      ],
    );
  }
}