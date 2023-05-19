
import 'package:flutter/material.dart';
import 'package:lemon_pizza/order/bloc/order_enums.dart';
import 'package:lemon_pizza/order/ui/widgets/select_pizza_tile.dart';

class SelectPizzaColumn extends StatelessWidget {

  const SelectPizzaColumn({super.key});

  @override
  Widget build(BuildContext context) {
     return SizedBox(
       width: 400,
       // height: 500,
       child: GridView.count(
         crossAxisCount: 2,
         children: PizzaType.values.map((pizzaType) => SelectPizzaTile(pizzaType)).toList()
       ),
     );
  }
}