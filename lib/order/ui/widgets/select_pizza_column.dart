
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lemon_pizza/order/bloc/order_bloc.dart';
import 'package:lemon_pizza/order/bloc/order_state.dart';

class SelectPizzaColumn extends StatelessWidget {

  const SelectPizzaColumn({super.key});

  @override
  Widget build(BuildContext context) {
     return Center(
        child: Column(
          children: PizzaType.values.map((pizzaType){
            return TextButton(
              child: Text(pizzaType.name),
              onPressed: () {
                context.read<OrderBloc>().addOrderItem(OrderItem(pizzaType));
              },
            );
          }).toList()
        ),
     );
  }
}