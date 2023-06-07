
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_ratio/constants.dart';
import 'package:lemon_pizza/blocs/order/order_bloc.dart';
import 'package:lemon_pizza/blocs/select/select_bloc.dart';
import 'package:lemon_pizza/model/pizza_size.dart';

import 'order_items_dialog/orders_dialog.dart';
import 'pizza_size_dialog/pizza_size_dialog.dart';
import 'pizza_type_grid/pizza_type_grid.dart';



class CreateOrderViewDesktop extends StatelessWidget {
  const CreateOrderViewDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final selectBloc = context.watch<SelectBloc>();

    return LayoutBuilder(builder: (context, size){
      return Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: double.infinity,
            alignment: Alignment.topCenter,
            child: const PizzaTypeGrid(),
          ),
          if (context.watch<OrderBloc>().state.orderItems.isNotEmpty)
            const Positioned(
              top: 16,
              right: 16,
              child: OrderItemsDialog(),
            ),
          if (selectBloc.state.pizzaType != null)
            const PizzaSizeDialog(),
        ],
      );
    });
  }

  static double getIconSize(PizzaSize pizzaSize) {
    switch (pizzaSize) {
      case PizzaSize.small:
        return 1.0;
      case PizzaSize.medium:
        return goldenRatio_1381;
      case PizzaSize.large:
        return goldenRatio_1618;
    }
  }
}