
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lemon_pizza/order/bloc/order_bloc.dart';
import 'package:lemon_pizza/order/ui/widgets/order_bloc_builder.dart';
import 'package:lemon_pizza/utils/format_dollars.dart';
import 'package:lemon_widgets/lemon_widgets.dart';

class CheckoutButton extends StatelessWidget {
  const CheckoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
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
            color: orderItems.isEmpty ? theme.colorScheme.tertiary : theme.colorScheme.error,
            child: Text("CHECKOUT ${formatDollars(orderState.totalOrderCost)}", style: const TextStyle(color: Colors.white),)),
      );
    });
  }
}