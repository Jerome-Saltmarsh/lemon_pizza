import 'package:flutter/material.dart';
import 'package:lemon_pizza/ui/views/order_status_view.dart';
import 'package:lemon_pizza/ui/widgets/device_builder.dart';
import 'package:lemon_widgets/lemon_widgets.dart';

import 'widgets/app_bar/app_bar_title.dart';
import 'widgets/app_bar/order_back_button.dart';
import 'widgets/app_bar/theme_hue_slider.dart';
import 'widgets/floating_action_button/pizza_box_floating_action_button.dart';
import 'widgets/toggles/theme_mode_toggle.dart';


class PizzaAppScaffold extends StatelessWidget {
  const PizzaAppScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    return LayoutBuilder(
      builder: (context, size) {
        final isMobile = size.maxWidth < 700;

        return Scaffold(
          appBar: AppBar(
            centerTitle: !isMobile,
            backgroundColor: colorScheme.surfaceVariant,
            title: AppBarTitle(compact: isMobile,),
            leading: const OrderBackButton(),
            actions: [
              if (!isMobile)
              const ThemeHueSlider(),
              if (!isMobile)
              Container(
                  margin: const EdgeInsets.only(right: 8),
                  child: const ThemeModeToggle()),
            ],
          ),
          floatingActionButton: DeviceBuilder(
            mobile: (context) {
              return const PizzaBoxFloatingActionButton();
            }
          ),
          body: const OrderStatusView(),
        );
      }
    );
  }

}