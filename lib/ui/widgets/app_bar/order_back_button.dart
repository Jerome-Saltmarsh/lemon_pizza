


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lemon_pizza/blocs/order/order_bloc.dart';
import 'package:lemon_pizza/model/order_status.dart';
import 'package:lemon_pizza/ui/widgets/order_status_changed.dart';

class OrderBackButton extends StatelessWidget {

  static const supportedOrderStatuses = [
    OrderStatus.customerDetails,
    OrderStatus.paymentDetails,
    OrderStatus.paymentFailed,
  ];

  const OrderBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    final backIcon = IconButton(
        icon: const Icon(Icons.navigate_before),
        onPressed: context.read<OrderBloc>().back,
    );
    return OrderStatusChanged((context, orderStatus) {
      if (supportedOrderStatuses.contains(orderStatus)){
         return backIcon;
      }
      return const SizedBox();
    });
  }
}