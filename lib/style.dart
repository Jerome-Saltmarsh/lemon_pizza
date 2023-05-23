
import 'package:flutter/material.dart';

class FontSize {
  static const titleLarge = 25.0;
  static const titleMedium = 20.0;
  static const titleSmall = 15.0;
  static const labelLarge = 12.0;
  static const labelMedium = 10.0;
  static const labelSmall = 8.0;
}

class Palette {

  static const grimbo = <Color>[
     Color.fromARGB(255, 223, 230, 224), // 0
     Color.fromARGB(255, 217, 194, 119), // 1
     Color.fromARGB(255, 193, 123, 092), // 2
     Color.fromARGB(255, 133, 068, 074), // 3
     Color.fromARGB(255, 074, 054, 060), // 4
     Color.fromARGB(255, 155, 161, 095), // 5
     Color.fromARGB(255, 089, 110, 071), // 6
     Color.fromARGB(255, 056, 069, 058), // 7
     Color.fromARGB(255, 169, 187, 204), // 8
     Color.fromARGB(255, 118, 135, 171), // 9
     Color.fromARGB(255, 118, 135, 171), // 10
     Color.fromARGB(255, 068, 074, 101), // 11
     Color.fromARGB(255, 068, 074, 101), // 12
     Color.fromARGB(255, 034, 034, 040), // 13
  ];
}

class Style {
  static final colorSchemeLight = ColorScheme(
     brightness: Brightness.light,
     primary: Palette.grimbo[0],
     onPrimary: Palette.grimbo[1],
     primaryContainer: Palette.grimbo[2],
     onPrimaryContainer: Palette.grimbo[3],
     secondary: Palette.grimbo[5],
     onSecondary: Palette.grimbo[6],
     onSecondaryContainer: Palette.grimbo[7],
     error: Palette.grimbo[2],
     onError: Palette.grimbo[3],
     background: Palette.grimbo[0],
     onBackground:  Palette.grimbo[1],
     surface: Palette.grimbo[11],
     onSurface: Palette.grimbo[12],
  );

  static final colorSchemeDark = ColorScheme(
    brightness: Brightness.dark,
    primary: Palette.grimbo[1],
    onPrimary: Palette.grimbo[2],
    primaryContainer: Palette.grimbo[3],
    onPrimaryContainer: Palette.grimbo[4],
    secondary: Palette.grimbo[5],
    onSecondary: Palette.grimbo[6],
    onSecondaryContainer: Palette.grimbo[7],
    error: Palette.grimbo[2],
    onError: Palette.grimbo[3],
    background: Palette.grimbo[4],
    onBackground:  Palette.grimbo[3],
    surface: Palette.grimbo[11],
    onSurface: Palette.grimbo[12],
  );

  static final themeDataLight = ThemeData().copyWith(
    useMaterial3: true,
    colorScheme: colorSchemeLight,
    scaffoldBackgroundColor: colorSchemeLight.background,
    dialogBackgroundColor:colorSchemeLight.primary,
    appBarTheme: const AppBarTheme().copyWith(
      backgroundColor: colorSchemeLight.onPrimary,
      foregroundColor: colorSchemeLight.onPrimaryContainer,
      centerTitle: true,
    ),
      textTheme: ThemeData().textTheme.copyWith(
        titleLarge: TextStyle(color: colorSchemeLight.onSecondaryContainer, fontSize: FontSize.titleLarge),
        titleMedium: TextStyle(color: colorSchemeLight.onSecondaryContainer, fontSize: FontSize.titleMedium),
        titleSmall: TextStyle(color: colorSchemeLight.onSecondaryContainer, fontSize: FontSize.labelSmall),
        labelLarge: TextStyle(color: colorSchemeLight.onSecondaryContainer, fontSize: FontSize.labelLarge),
        labelMedium: TextStyle(color: colorSchemeLight.onSecondaryContainer, fontSize: FontSize.labelMedium),
        labelSmall: TextStyle(color: colorSchemeLight.onSecondaryContainer, fontSize: FontSize.labelSmall),
    ),
  );

  static final themeDataDark = ThemeData().copyWith(
    useMaterial3: true,
    colorScheme: colorSchemeDark,
    scaffoldBackgroundColor: colorSchemeDark.background,
    dialogBackgroundColor: colorSchemeDark.tertiaryContainer,
    appBarTheme: const AppBarTheme().copyWith(
      backgroundColor: colorSchemeDark.onPrimaryContainer,
      foregroundColor: colorSchemeDark.primaryContainer,
      centerTitle: true,
    ),
    textTheme: ThemeData().textTheme.copyWith(
      titleLarge: TextStyle(color: Palette.grimbo[0], fontSize: FontSize.titleLarge),
      titleMedium: TextStyle(color: Palette.grimbo[0], fontSize: FontSize.titleMedium),
      titleSmall: TextStyle(color: Palette.grimbo[0], fontSize: FontSize.titleSmall),
      labelLarge: TextStyle(color: Palette.grimbo[0], fontSize: FontSize.labelLarge),
      labelMedium: TextStyle(color: Palette.grimbo[0], fontSize: FontSize.labelMedium),
      labelSmall: TextStyle(color: Palette.grimbo[0], fontSize: FontSize.labelSmall),
    ),
  );
}