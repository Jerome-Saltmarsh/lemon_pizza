
import 'package:flutter/cupertino.dart';

import 'order_items/order_items_column/order_items_column.dart';
import 'pizza_type/pizza_type_column/pizza_type_column.dart';

class CreateOrderViewTablet extends StatelessWidget {
  const CreateOrderViewTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(children: [
      SizedBox(
          width: 400,
          child: PizzaTypeColumn()),
      OrderItemsColumn(),
    ],);
  }

}