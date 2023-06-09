import 'package:flutter/material.dart';
import 'package:lemon_pizza/model/order_status.dart';
import 'package:lemon_pizza/ui/views/order_create_view/create_order_view_mobile.dart';
import 'package:lemon_pizza/ui/views/order_create_view/create_order_view_desktop.dart';
import 'package:lemon_pizza/ui/views/order_status_view.dart';
import 'package:lemon_widgets/lemon_widgets.dart';

import 'views/customer_details_view.dart';
import 'views/order_create_view/order_items_dialog/orders_dialog.dart';
import 'views/payment_details_view.dart';
import 'views/payment_failed_view.dart';
import 'views/payment_in_progress_view.dart';
import 'views/payment_succeeded_view.dart';
import 'views/type_type_view.dart';
import 'widgets/app_bar/app_bar_title.dart';
import 'widgets/app_bar/order_back_button.dart';
import 'widgets/app_bar/theme_hue_slider.dart';
import 'widgets/pizza_box_floating_action_button.dart';
import 'widgets/order_status_changed.dart';
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
              const SizedBox(
                width: 200,
                child: ThemeHueSlider(),
              ),
              if (!isMobile)
              Container(
                  margin: const EdgeInsets.only(right: 8),
                  child: const ThemeModeToggle()),
            ],
          ),
          floatingActionButton: const PizzaBoxFloatingActionButton(),
          body: OrderStatusView(),
        );
      }
    );
  }

}