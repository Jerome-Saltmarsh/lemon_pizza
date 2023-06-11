
import 'package:flutter/material.dart';
import 'package:lemon_pizza_domain/lemon_pizza_domain.dart';

import 'pizza_type_column_item.dart';

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