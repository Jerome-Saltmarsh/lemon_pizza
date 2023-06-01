
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lemon_pizza/theme/bloc/theme_bloc.dart';
import 'package:lemon_widgets/lemon_widgets.dart';

class ThemeModeToggle extends StatelessWidget {
  const ThemeModeToggle({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    final themeBloc = context.watch<ThemeBloc>();
    return Row(
      children: [
        Text(
          themeBloc.isDark ? 'DARK' : "LIGHT", style: TextStyle(color: colorScheme.onPrimary),),
        const SizedBox(width: 8),
        Switch(
          activeColor: colorScheme.secondary,
          activeTrackColor: colorScheme.onSecondary,
          inactiveThumbColor: colorScheme.tertiary,
          value: themeBloc.isDark,
          onChanged: themeBloc.setDarkMode,
        ),
      ],
    );
  }
}