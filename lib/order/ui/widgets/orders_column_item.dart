
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lemon_pizza/order/bloc/order_bloc.dart';
import 'package:lemon_pizza/order/bloc/order_state.dart';

class OrdersColumnItem extends StatelessWidget {

  final OrderItem orderItem;

  const OrdersColumnItem({super.key, required this.orderItem});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(orderItem.pizzaType.name),
            Text(orderItem.pizzaSize.name),
          ],
        ),
        TextButton(child: const Text("remove"), onPressed: ()  {
          context.read<OrderBloc>().removeOrderItem(orderItem);
        },),
      ],
    );
  }

}