import 'package:flutter/material.dart';
import 'package:lemon_pizza/ui/common/extensions/build_context_extension.dart';
import 'package:lemon_pizza/ui/common/sliders/theme_hue_slider.dart';
import 'package:lemon_pizza/ui/common/texts/text_on_primary.dart';
import 'package:lemon_pizza/ui/common/texts/title_text.dart';
import 'package:lemon_pizza/ui/common/toggles/theme_mode_toggle.dart';
import 'package:lemon_widgets/lemon_widgets.dart';

import 'views/order_status_view.dart';
import 'widgets/order_back_button.dart';


class ScaffoldDesktop extends StatelessWidget {
  const ScaffoldDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final fontSize = context.fontSize;
    final colorScheme = context.colorScheme;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: colorScheme.primary,
        title: const TitleText(),
        leading: const OrderBackButton(),
        actions: [
        const SizedBox(
          width: 200,
          child: ThemeHueSlider(),
        ),
          Container(
              margin: const EdgeInsets.only(right: 8),
              child: const ThemeModeToggle()),
          TextButton(
            onPressed: () => Navigator.of(context).pushNamed('theme'),
            child: TextOnPrimary("THEME", fontSize: fontSize.regular),
          )
        ],
      ),
      body: const OrderStatusView(),
    );
  }

}