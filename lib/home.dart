import 'package:flutter/material.dart';
import 'package:lemon_pizza/order/ui/widgets/checkout_icon.dart';
import 'package:lemon_pizza/theme/ui/theme_mode_toggle.dart';
import 'package:lemon_widgets/lemon_widgets.dart';

import 'order/ui/views/order_status_view.dart';
import 'order/ui/widgets/order_back_button.dart';
import 'order/ui/widgets/order_floating_action_button.dart';

class Home extends StatelessWidget {
  const Home({super.key});


  @override
  Widget build(BuildContext context) =>
      Scaffold(
        backgroundColor: context.theme.scaffoldBackgroundColor,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: context.theme.appBarTheme.backgroundColor,
          title: SizedBox(
            width: 600,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text("PIZZA STORE"),
                Container(
                  margin: const EdgeInsets.only(right: 16),
                  child: const CheckoutIcon(),
                )
              ],
            ),
          ),
          leading: const OrderBackButton(),
          actions: [
            Container(
                margin: const EdgeInsets.only(right: 8),
                child: const ThemeModeToggle()
            ),
            // Container(
            //     margin: const EdgeInsets.only(right: 16),
            //     child: const CheckoutIcon(),
            // )
          ],
        ),
        body: const OrderStatusView(),
        floatingActionButton: const OrderStatusFloatingActionButton(),
      );
}
