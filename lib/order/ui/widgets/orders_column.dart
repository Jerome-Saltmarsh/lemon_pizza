
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lemon_pizza/order/bloc/order_bloc.dart';
import 'package:lemon_pizza/widgets/fade_in.dart';
import 'package:lemon_pizza/widgets/on_pressed.dart';
import 'package:lemon_pizza/order/ui/widgets/orders_column_item.dart';
import 'package:lemon_pizza/utils/format_dollars.dart';

class OrdersColumn extends StatelessWidget {

  const OrdersColumn({super.key});

  @override
  Widget build(BuildContext context) {
    final orderBloc = context.watch<OrderBloc>();
    final orderState = orderBloc.state;
    final orderItems = orderState.orderItems;

    return FadeIn(
      child: Container(
        width: 200,
        padding: const EdgeInsets.all(16),
        constraints: const BoxConstraints(maxHeight: 400),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.black,
            width: 1.0,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text("ORDERS PLACED"),
            Expanded(
              child: Container(
                constraints: const BoxConstraints(maxHeight: 300),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: orderItems.map(
                                (orderItem) => OrdersColumnItem(orderItem: orderItem)
                        ).toList(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            OnPressed(
              action: context.read<OrderBloc>().next,
              child: Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  height: 40,
                  color: Colors.red,
                  child: Text("CHECKOUT ${formatDollars(orderState.totalOrderCost)}")),
            ),
          ],
        ),
      ),
    );
  }

}