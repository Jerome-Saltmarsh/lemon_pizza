import 'package:flutter/material.dart';
import 'package:lemon_pizza/order/ui/widgets/checkout_icon.dart';
import 'package:lemon_pizza/theme/ui/theme_mode_toggle.dart';

import 'order/ui/views/order_status_view.dart';
import 'order/ui/widgets/order_back_button.dart';
import 'order/ui/widgets/order_floating_action_button.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) =>
      Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("PIZZA STORE"),
          leading: const OrderBackButton(),
          actions: [
            const ThemeModeToggle(),
            Container(
                margin: const EdgeInsets.only(right: 16),
                child: const CheckoutIcon(),
            )
          ],
        ),
        body: const OrderStatusView(),
        floatingActionButton: const OrderStatusFloatingActionButton(),
      );
}
