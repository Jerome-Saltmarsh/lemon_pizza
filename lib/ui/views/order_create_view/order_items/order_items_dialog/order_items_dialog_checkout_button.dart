
import 'package:flutter/material.dart';
import 'package:lemon_pizza/ui/font_families.dart';
import 'package:lemon_pizza/ui/extensions/build_context_extension.dart';
import 'package:lemon_pizza/ui/functions/format_dollars.dart';
import 'package:lemon_pizza/ui/widgets/order_bloc_builder.dart';
import 'package:lemon_widgets/lemon_widgets.dart';

class OrderItemsDialogCheckoutButton extends StatelessWidget {
  const OrderItemsDialogCheckoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;

    return OrderBlocBuilder(builder: (context, orderState){
      final orderItems = orderState.orderItems;
      return OnPressed(
        action: orderItems.isEmpty ? null : context.selectOrderStatusOrderType,
        child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            alignment: Alignment.center,
            height: 40,
            decoration: BoxDecoration(
              color: colorScheme.error,
              borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(4), bottomRight: Radius.circular(4)),
            ),

            child: Text("CHECKOUT ${formatDollars(orderState.totalOrderCost)}",
              style: TextStyle(
                  fontSize: context.fontSize.small,
                  color: colorScheme.onError, fontFamily: FontFamilies.roboto),)),
      );
    });
  }
}