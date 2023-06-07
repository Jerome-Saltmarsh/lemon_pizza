
import 'package:flutter/cupertino.dart';
import 'package:lemon_pizza/model/pizza_size.dart';

import 'pizza_size_dialog_row_button.dart';

class PizzaSizeDialogRow extends StatelessWidget {
  const PizzaSizeDialogRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: PizzaSize.values
          .map((pizzaSize) => PizzaSizeDialogRowButton(pizzaSize: pizzaSize))
          .toList(),
    );
  }
}