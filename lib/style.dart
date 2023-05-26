
import 'package:flutter/material.dart';

class FontSize {
  static const titleLarge = 25.0;
  static const titleMedium = 20.0;
  static const titleSmall = 15.0;
  static const labelLarge = 12.0;
  static const labelMedium = 10.0;
  static const labelSmall = 8.0;
}

class Style {

  static final dialogBorderRadius = BorderRadius.circular(4);

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


  static const themeColor = Colors.red;
  static final themeDataLight = ThemeData(colorSchemeSeed: themeColor, brightness: Brightness.light);
  static final themeDataDark = ThemeData(colorSchemeSeed: themeColor, brightness: Brightness.dark);

  // static final themeDataDark = ThemeData().copyWith(
  //   useMaterial3: true,
  //   brightness: Brightness.dark,
  //   scaffoldBackgroundColor: grimbo[0],
  //   dialogBackgroundColor: grimbo[0],
  //   appBarTheme: const AppBarTheme().copyWith(
  //     backgroundColor: grimbo[1],
  //     foregroundColor: grimbo[2],
  //     centerTitle: true,
  //   ),
  //   textTheme: ThemeData().textTheme.copyWith(
  //     titleLarge: TextStyle(color: grimbo[13], fontSize: FontSize.titleLarge),
  //     titleMedium: TextStyle(color: grimbo[13], fontSize: FontSize.titleMedium),
  //     titleSmall: TextStyle(color: grimbo[13], fontSize: FontSize.titleSmall),
  //     labelLarge: TextStyle(color: grimbo[13], fontSize: FontSize.labelLarge),
  //     labelMedium: TextStyle(color: grimbo[13], fontSize: FontSize.labelMedium),
  //     labelSmall: TextStyle(color: grimbo[13], fontSize: FontSize.labelSmall),
  //   ),
  // );
}