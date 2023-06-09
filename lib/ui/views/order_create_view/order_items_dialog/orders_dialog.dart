
import 'package:flutter/material.dart';
import 'package:lemon_pizza/ui/views/order_create_view/order_items_dialog/orders_column.dart';
import 'package:lemon_widgets/lemon_widgets.dart';

import 'checkout_button.dart';


class OrderItemsDialog extends StatelessWidget {

  const OrderItemsDialog({super.key});

  @override
  Widget build(BuildContext context) => FadeIn(
      child: SizedBox(
        width: 200,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              constraints: const BoxConstraints(maxHeight: 400),
              decoration: BoxDecoration(
                color: context.colorScheme.surfaceVariant,
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(4), topRight: Radius.circular(4)),
              ),
              child: const OrdersColumn(),
            ),
            const CheckoutButton(),
          ],
        ),
      ),
    );

}