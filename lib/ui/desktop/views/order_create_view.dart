
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lemon_pizza/blocs/order/order_bloc.dart';
import 'package:lemon_pizza/ui/desktop/dialogs/orders_dialog.dart';
import 'package:lemon_pizza/ui/desktop/dialogs/select_pizza_size_dialog.dart';
import 'package:lemon_pizza/ui/desktop/widgets/select_pizza_column.dart';


class CreateOrderView extends StatelessWidget {

  const CreateOrderView({super.key});

  @override
  Widget build(BuildContext context) {

    final orderBloc = context.watch<OrderBloc>();

    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
            margin: const EdgeInsets.only(top: 16),
            width: double.infinity,
            alignment: Alignment.topCenter,
            child: const SelectPizzaColumn(),
        ),
        if (orderBloc.state.orderItems.isNotEmpty)
        const Positioned(
            top: 16,
            right: 16,
            child: OrdersDialog()),
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