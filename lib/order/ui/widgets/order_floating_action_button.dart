
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lemon_pizza/order/bloc/order_bloc.dart';

class OrderStatusFloatingActionButton extends StatelessWidget {

  const OrderStatusFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    final orderBloc = context.watch<OrderBloc>();
    return FloatingActionButton(
      onPressed: orderBloc.next,
      tooltip: orderBloc.state.nextOrderStatus.name,
      child: const Icon(Icons.navigate_next),
    );
  }
}