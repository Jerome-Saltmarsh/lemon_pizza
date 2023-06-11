


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lemon_pizza_domain/lemon_pizza_domain.dart';
import 'package:lemon_pizza_ui/blocs/order/order_bloc.dart';
import 'package:lemon_pizza_ui/ui/widgets/order_status_changed.dart';
import 'package:lemon_widgets/lemon_widgets.dart';

class OrderBackButton extends StatelessWidget {

  static const supportedOrderStatuses = [
    OrderStatus.reviewOrder,
    OrderStatus.customerDetails,
    OrderStatus.paymentDetails,
    OrderStatus.paymentFailed,
  ];

  const OrderBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    final backIcon = IconButton(
        icon: Icon(Icons.navigate_before, color: context.colorScheme.onSurfaceVariant,),
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