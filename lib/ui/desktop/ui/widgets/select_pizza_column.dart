
import 'package:flutter/material.dart';
import 'package:lemon_pizza/blocs/order/order_enums.dart';
import 'package:lemon_pizza/ui/common/widgets/tiles/add_pizza_tile.dart';

import 'select_pizza_tile.dart';

class SelectPizzaColumn extends StatelessWidget {

  const SelectPizzaColumn({super.key});

  @override
  Widget build(BuildContext context) {
     return SizedBox(
       width: 400,
       child: GridView.count(
         physics: const NeverScrollableScrollPhysics(),
         crossAxisCount: 2,
         children: PizzaType.values.map((pizzaType) => SelectPizzaTile(pizzaType)).toList()
       ),
     );
  }
}