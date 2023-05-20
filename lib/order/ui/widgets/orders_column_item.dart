
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lemon_pizza/order/bloc/order_bloc.dart';
import 'package:lemon_pizza/order/bloc/order_state.dart';
import 'package:lemon_pizza/utils/format_dollars.dart';

class OrdersColumnItem extends StatelessWidget {

  final OrderItem orderItem;

  const OrdersColumnItem({super.key, required this.orderItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.only(top: 8),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.black54,
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
              Text(orderItem.pizzaType.name),
              Text(orderItem.pizzaSize.name),
              Text(formatDollars(orderItem.totalCost)),
            ],
          ),
          TextButton(child: const Text("remove"), onPressed: ()  {
            context.read<OrderBloc>().removeOrderItem(orderItem);
          },),
        ],
      ),
    );
  }

}