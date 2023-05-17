
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lemon_pizza/order/bloc/order_bloc.dart';

class OrdersColumn extends StatelessWidget {

  const OrdersColumn({super.key});

  @override
  Widget build(BuildContext context) {
    final orderBloc = context.watch<OrderBloc>();
    final orderState = orderBloc.state;
    final orderItems = orderState.orderItems;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 2.0,
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Text("ORDERS PLACED"),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: orderItems.map(
                      (orderItem) => Row(
                        children: [
                          Text(orderItem.pizzaType.name),
                          TextButton(child: const Text("remove"), onPressed: (){
                             orderBloc.removeOrderItem(orderItem);
                          },),
                        ],
                      )
              ).toList(),
            ),
          ],
        ),
      ),
    );
  }

}