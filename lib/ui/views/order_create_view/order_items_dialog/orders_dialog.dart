
import 'package:flutter/material.dart';
import 'package:lemon_pizza/ui/common/font_families.dart';
import 'package:lemon_pizza/ui/extensions/build_context_extension.dart';
import 'package:lemon_pizza/ui/views/order_create_view/order_items_dialog/checkout_button.dart';
import 'package:lemon_widgets/lemon_widgets.dart';

import 'orders_dialog_item.dart';

class OrderItemsDialog extends StatelessWidget {

  const OrderItemsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final orderState = context.watchOrderState;
    final orderItems = orderState.orderItems;
    final colorScheme = context.colorScheme;
    final themeState = context.readThemeState;
    final fontSize = themeState.fontSize;

    return FadeIn(
      child: Container(
        width: 200,
        padding: const EdgeInsets.all(16),
        constraints: const BoxConstraints(maxHeight: 400),
        decoration: BoxDecoration(
          color: colorScheme.surfaceVariant,
          borderRadius: themeState.dialogBorderRadius,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("ORDERS PLACED", style: TextStyle(
                fontFamily: FontFamilies.secondary,
                color: colorScheme.secondary, fontSize: fontSize.large),),
            Expanded(
              child: Container(
                constraints: const BoxConstraints(maxHeight: 300),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: orderItems.map(
                                (orderItem) => OrdersDialogItem(orderItem: orderItem)
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