
import 'package:flutter/cupertino.dart';
import 'package:lemon_pizza/ui/extensions/build_context_extension.dart';
import 'package:lemon_pizza/ui/font_families.dart';
import 'package:lemon_widgets/lemon_widgets.dart';

import 'orders_dialog_item.dart';

class OrdersColumn extends StatelessWidget {
  const OrdersColumn({super.key});

  @override
  Widget build(BuildContext context) {
    final orderState = context.watchOrderState;
    final orderItems = orderState.orderItems;
    final colorScheme = context.colorScheme;
    final themeState = context.readThemeState;
    final fontSize = themeState.fontSize;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text("ORDERS PLACED", style: TextStyle(
            fontFamily: FontFamilies.secondary,
            color: colorScheme.secondary, fontSize: fontSize.large),),
        Container(
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
      ],
    );
  }
}