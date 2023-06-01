
import 'package:flutter/material.dart';
import 'package:lemon_widgets/lemon_widgets.dart';

import '../../../ui/theme/color_scheme_column.dart';
import '../../../ui/theme/theme_mode_toggle.dart';

class ThemePage extends StatelessWidget {
  const ThemePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
          ),
          actions: const [
            ThemeModeToggle()
          ],
        ),
        body: ColorSchemeColumn(colorScheme: context.colorScheme));
  }

}