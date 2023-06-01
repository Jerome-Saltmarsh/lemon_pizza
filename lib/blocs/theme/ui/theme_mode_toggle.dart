
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lemon_pizza/blocs/theme/bloc/theme_bloc.dart';
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
          activeColor: colorScheme.primary,
          activeTrackColor: colorScheme.onPrimary,
          inactiveThumbColor: colorScheme.primary,
          inactiveTrackColor: colorScheme.onPrimary,
          value: themeBloc.isDark,
          onChanged: themeBloc.setDarkMode,
        ),
      ],
    );
  }
}