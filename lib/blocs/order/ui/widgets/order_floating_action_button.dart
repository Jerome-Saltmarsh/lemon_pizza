
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lemon_pizza/blocs/order/bloc/order_bloc.dart';
import 'package:lemon_pizza/blocs/order/bloc/order_enums.dart';
import 'package:lemon_widgets/lemon_widgets.dart';

import 'buttons/checkout_button.dart';

class OrderStatusFloatingActionButton extends StatelessWidget {

  const OrderStatusFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    final orderBloc = context.watch<OrderBloc>();
    final orderState = orderBloc.state;

    if (orderState.ordersPlacedVisible) {
      return nothing;
    }

    if (orderState.orderStatus == OrderStatus.createOrder){
      return const CheckoutButton();
    }

    return FloatingActionButton(
      onPressed: orderBloc.next,
      tooltip: orderBloc.nextOrderStatus.name,
      child: const Icon(Icons.navigate_next),
    );
  }
}