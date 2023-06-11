
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lemon_pizza_domain/lemon_pizza_domain.dart';
import 'package:lemon_pizza_ui/blocs/order/order_bloc.dart';

import 'pizza_type_grid_tile.dart';

class PizzaTypeGrid extends StatelessWidget {
  const PizzaTypeGrid({super.key});

  @override
  Widget build(BuildContext context) {
      final screenWidth = MediaQuery.of(context).size.width;
      final orderBloc = context.watch<OrderBloc>();
      final orderState = orderBloc.state;


      return AnimatedContainer(
        duration: const Duration(milliseconds: 200),
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