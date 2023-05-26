
import 'package:flutter/material.dart';
import 'package:lemon_pizza/order/ui/extensions/build_context_extensions.dart';
import 'package:lemon_pizza/order/ui/widgets/orders_column_item.dart';
import 'package:lemon_widgets/lemon_widgets.dart';

import '../widgets/buttons/checkout_button.dart';

class OrdersDialog extends StatelessWidget {

  const OrdersDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final orderState = context.watchOrderState;
    final orderItems = orderState.orderItems;

    return FadeIn(
      child: Container(
        width: 200,
        padding: const EdgeInsets.all(16),
        constraints: const BoxConstraints(maxHeight: 400),
        decoration: BoxDecoration(
          color: context.theme.dialogBackgroundColor,
          border: Border.all(
            color: Colors.black,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text("ORDERS PLACED"),
            Expanded(
              child: Container(
                constraints: const BoxConstraints(maxHeight: 300),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: orderItems.map(
                                (orderItem) => OrdersColumnItem(orderItem: orderItem)
                        ).toList(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const CheckoutButton(),
          ],
        ),
      ),
    );
  }

}