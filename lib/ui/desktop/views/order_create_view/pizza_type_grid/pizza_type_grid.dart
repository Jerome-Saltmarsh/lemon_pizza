
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lemon_pizza/blocs/order/order_bloc.dart';
import 'package:lemon_pizza/model/pizza_type.dart';

import 'pizza_type_grid_tile.dart';

class PizzaTypeGrid extends StatelessWidget {
  const PizzaTypeGrid({super.key});

  @override
  Widget build(BuildContext context) {
      final screenWidth = MediaQuery.of(context).size.width;
      final orderBloc = context.watch<OrderBloc>();
      final orderState = orderBloc.state;

      return Container(
        width:  screenWidth - 300,
        constraints: const BoxConstraints(
          maxWidth: 700,
        ),
        margin: EdgeInsets.only(right: orderState.orderItems.isEmpty ? 0 : 160),
        child: Wrap(
            children: PizzaType.values.map((pizzaType) => PizzaTypeGridTile(pizzaType: pizzaType)).toList()
        ),
      );
  }
}