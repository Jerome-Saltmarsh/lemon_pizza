
import 'package:flutter/material.dart';
import 'package:lemon_pizza/ui/common/font_families.dart';
import 'package:lemon_pizza/ui/extensions/build_context_extension.dart';
import 'package:lemon_pizza/ui/functions/format_dollars.dart';
import 'package:lemon_pizza/ui/widgets/order_bloc_builder.dart';
import 'package:lemon_widgets/lemon_widgets.dart';

class CheckoutButton extends StatelessWidget {
  const CheckoutButton({super.key});

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
            width: double.infinity,
            constraints: const BoxConstraints(
              maxWidth: 150,
            ),
            height: 40,
            color: colorScheme.error,
            child: Text("CHECKOUT ${formatDollars(orderState.totalOrderCost)}",
              style: TextStyle(color: colorScheme.onError, fontFamily: FontFamilies.secondary),)),
      );
    });
  }
}