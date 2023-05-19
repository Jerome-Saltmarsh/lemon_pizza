
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lemon_pizza/order/bloc/order_bloc.dart';
import 'package:lemon_pizza/order/ui/dialogs/select_pizza_size_dialog.dart';

import '../widgets/orders_column.dart';
import '../widgets/select_pizza_column.dart';

class CreateOrderView extends StatelessWidget {

  const CreateOrderView({super.key});

  @override
  Widget build(BuildContext context) {

    final orderBloc = context.watch<OrderBloc>();

    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SelectPizzaColumn(),
              OrdersColumn(),
            ],
          ),
        ),
        const SelectPizzaSizeDialog(),
        if (orderBloc.state.validate && orderBloc.state.orderItems.isEmpty)
          Container(
              width: 300,
              height: 200,
              color: Colors.red,
              child: Column(
                children: [
                  const Text("ADD ITEMS TO YOUR ORDER"),
                  TextButton(
                      onPressed: () => context.read<OrderBloc>().emitOrderState(
                        validate: false
                      ),
                      child: const Text("CLOSE")),
                ],
              )
          ),
      ],
    );
  }
}