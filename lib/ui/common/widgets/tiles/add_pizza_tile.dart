
import 'package:flutter/material.dart';
import 'package:lemon_pizza/blocs/order/order_enums.dart';
import 'package:lemon_pizza/ui/common/extensions/build_context_extension.dart';
import 'package:lemon_pizza/ui/desktop/ui/utils/format_dollars.dart';
import 'package:lemon_widgets/lemon_widgets.dart';

class AddPizzaTile extends StatelessWidget {

  final PizzaType pizzaType;

  const AddPizzaTile({super.key, required this.pizzaType});

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    final fontSize = context.fontSize;
    final pizzaPrice = context.orderRepository.getPizzaPrice(
        pizzaType: pizzaType,
        pizzaSize: PizzaSize.medium,
    );

    return ListTile(
      title: Text(pizzaType.name, style: TextStyle(fontSize: fontSize.regular, color: colorScheme.secondary),),
      leading: Text(formatDollars(pizzaPrice)),
      subtitle: Text(pizzaType.ingredients.map((e) => e.name).reduce((previousValue, element) => '$previousValue, $element'),
        style: TextStyle(
          fontSize: fontSize.small,
          color: colorScheme.tertiary,
        ),
      ),
      trailing: TextButton(
        onPressed: () {

        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
              return colorScheme.primary; // Default color
            },
          ),
        ),
        child: Text("ADD", style: TextStyle(color: colorScheme.onPrimary, fontSize: fontSize.regular),),
      ),
    );
  }

}