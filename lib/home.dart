import 'package:flutter/material.dart';
import 'package:lemon_pizza/order/ui/widgets/checkout_icon.dart';
import 'package:lemon_pizza/theme/ui/theme_mode_toggle.dart';
import 'package:lemon_pizza/widgets/texts/text_on_primary.dart';
import 'package:lemon_widgets/lemon_widgets.dart';

import 'order/ui/views/order_status_view.dart';
import 'order/ui/widgets/order_back_button.dart';
import 'style.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) =>
      Scaffold(
        // backgroundColor: context.colorScheme.primary,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: context.colorScheme.primary,
          title: SizedBox(
            width: 600,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("PIZZA NOW", style: TextStyle(
                  color: context.colorScheme.onPrimary,
                  fontSize: FontSize.titleLarge,
                ),),
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
            TextButton(
              onPressed: () => Navigator.of(context).pushNamed('theme'),
              child: const TextOnPrimary("THEME", fontSize: FontSize.labelMedium),
            )
          ],
        ),
        body: const OrderStatusView(),
        // floatingActionButton: const OrderStatusFloatingActionButton(),
      );
}
