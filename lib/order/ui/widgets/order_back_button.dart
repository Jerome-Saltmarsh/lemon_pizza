


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lemon_pizza/order/bloc/order_bloc.dart';
import 'package:lemon_pizza/order/bloc/order_state.dart';
import 'package:lemon_pizza/order/ui/widgets/order_status_changed.dart';

class OrderBackButton extends StatelessWidget {
  const OrderBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    final backIcon = IconButton(
        icon: const Icon(Icons.navigate_before),
        onPressed: context.read<OrderBloc>().back,
    );
    return OrderStatusChanged((context, orderStatus) {
       switch(orderStatus) {
         case OrderStatus.customerDetails:
           return backIcon;
         default:
           return const SizedBox();
       }

    });
  }
}