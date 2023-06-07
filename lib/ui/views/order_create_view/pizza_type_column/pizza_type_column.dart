
import 'package:flutter/material.dart';
import 'package:lemon_pizza/model/pizza_type.dart';
import 'package:lemon_pizza/ui/views/order_create_view/pizza_type_column/pizza_type_column_item.dart';

class PizzaTypeColumn extends StatelessWidget {
  const PizzaTypeColumn({super.key});

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
      child: Column(
        children: PizzaType.values.map((pizzaType) =>
            PizzaTypeColumnItem(pizzaType: pizzaType)).toList(),
      ),
    );

}