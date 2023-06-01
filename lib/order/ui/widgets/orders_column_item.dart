
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lemon_pizza/order/bloc/order_bloc.dart';
import 'package:lemon_pizza/order/bloc/order_state.dart';
import 'package:lemon_pizza/utils/format_dollars.dart';
import 'package:lemon_widgets/lemon_widgets.dart';

class OrdersColumnItem extends StatelessWidget {

  final OrderItem orderItem;

  const OrdersColumnItem({super.key, required this.orderItem});

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;

    return Container(
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.only(top: 8),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: colorScheme.onSecondary,
            width: 1.0,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(orderItem.pizzaType.name, style: TextStyle(color: colorScheme.onSecondary),),
              Text(orderItem.pizzaSize.name, style: TextStyle(color: colorScheme.onSecondary)),
              Text(formatDollars(orderItem.totalCost), style: TextStyle(color: colorScheme.onSecondary)),
            ],
          ),
          TextButton(child: Text("remove", style: TextStyle(color: colorScheme.error),), onPressed: ()  {
            context.read<OrderBloc>().removeOrderItem(orderItem);
          },),
        ],
      ),
    );
  }

}