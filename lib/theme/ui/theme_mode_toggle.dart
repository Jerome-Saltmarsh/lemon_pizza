
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lemon_pizza/theme/bloc/theme_bloc.dart';
import 'package:lemon_widgets/lemon_widgets.dart';

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
          activeColor: context.theme.primaryColor,
          activeTrackColor: context.theme.secondaryHeaderColor,
          inactiveThumbColor: context.theme.secondaryHeaderColor,
          value: themeBloc.isDark,
          onChanged: themeBloc.setDarkMode,
        ),
      ],
    );
  }
}