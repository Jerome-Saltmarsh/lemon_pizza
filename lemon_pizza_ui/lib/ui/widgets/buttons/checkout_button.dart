
import 'package:flutter/material.dart';
import 'package:lemon_pizza_ui/ui/extensions/build_context_extension.dart';
import 'package:lemon_pizza_ui/ui/font_families.dart';
import 'package:lemon_pizza_ui/ui/functions/format_dollars.dart';
import 'package:lemon_pizza_ui/ui/widgets/order_bloc_builder.dart';
import 'package:lemon_widgets/lemon_widgets.dart';

class CheckoutButton extends StatelessWidget {

  final BorderRadiusGeometry borderRadius;

  const CheckoutButton({super.key, required this.borderRadius});

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
              borderRadius: borderRadius,
            ),

            child: Text("CHECKOUT ${formatDollars(orderState.totalOrderCost)}",
              style: TextStyle(
                  fontSize: context.fontSize.small,
                  color: colorScheme.onError, fontFamily: FontFamilies.roboto),)),
      );
    });
  }
}