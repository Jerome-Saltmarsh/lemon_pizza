
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lemon_pizza/blocs/order/order_bloc.dart';
import 'package:lemon_pizza/ui/common/font_families.dart';
import 'package:lemon_pizza/ui/common/functions/format_dollars.dart';
import 'package:lemon_pizza/ui/desktop/widgets/order_bloc_builder.dart';
import 'package:lemon_widgets/lemon_widgets.dart';

class CheckoutButton extends StatelessWidget {
  const CheckoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;

    return OrderBlocBuilder(builder: (context, orderState){
      final orderItems = orderState.orderItems;
      return OnPressed(
        action: orderItems.isEmpty ? null : context.read<OrderBloc>().next,
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