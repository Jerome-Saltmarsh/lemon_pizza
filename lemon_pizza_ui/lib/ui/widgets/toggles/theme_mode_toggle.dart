
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lemon_pizza_ui/blocs/theme/theme_bloc.dart';
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
          themeBloc.isDark ? 'DARK' : "LIGHT", style: TextStyle(color: colorScheme.onSurfaceVariant, fontFamily: 'CabinSketch'),),
        const SizedBox(width: 8),
        Switch(
          activeColor: colorScheme.onInverseSurface,
          activeTrackColor: colorScheme.onSurface,
          inactiveThumbColor: colorScheme.onSurface,
          inactiveTrackColor: colorScheme.onInverseSurface,
          value: themeBloc.isDark,
          onChanged: themeBloc.setDarkMode,
        ),
      ],
    );
  }
}