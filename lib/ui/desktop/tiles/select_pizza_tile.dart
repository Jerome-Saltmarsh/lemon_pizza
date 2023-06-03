
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_ratio/constants.dart';
import 'package:lemon_pizza/blocs/order/order_enums.dart';
import 'package:lemon_pizza/blocs/order/order_repository.dart';
import 'package:lemon_pizza/ui/common/extensions/build_context_extension.dart';
import 'package:lemon_pizza/ui/common/font_families.dart';
import 'package:lemon_pizza/ui/common/functions/map_ingredients_to_string.dart';
import 'package:lemon_pizza/ui/common/functions/format_dollars.dart';
import 'package:lemon_widgets/lemon_widgets.dart';

class SelectPizzaTile extends StatelessWidget {

  final PizzaType pizzaType;

  const SelectPizzaTile(this.pizzaType, {super.key});

  @override
  Widget build(BuildContext context) {

    final fontSize = context.fontSize;
    final orderRepository = RepositoryProvider.of<OrderRepository>(context);
    final pizzaPrice = orderRepository.getPizzaPrice(pizzaType: pizzaType, pizzaSize: PizzaSize.medium);
    final colorScheme = context.colorScheme;
    const width = 150.0;

    return Container(
      width: width,
      height: width * goldenRatio_0618,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(pizzaType.name, style: TextStyle(fontSize: fontSize.large, color: colorScheme.secondary)),
              Container(
                  width: 60,
                  alignment: Alignment.center,
                  color: colorScheme.primaryContainer,
                  padding: const EdgeInsets.all(2),
                  child: Text(formatDollars(pizzaPrice), style: TextStyle(fontSize: fontSize.small, color: colorScheme.onPrimaryContainer))),
            ],
          ),
          Text(mapIngredientsToString(pizzaType.ingredients),
            style: TextStyle(fontSize: fontSize.regular, color: colorScheme.tertiary),

          ),
          // Text(formatDollars(pizzaPrice), style: TextStyle(fontSize: fontSize.small, color: colorScheme.secondary),),
          const SizedBox(height: 12),
          OnPressed(
            action: () => context.selectPizzaType(pizzaType),
            child: Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: colorScheme.primary
                ),
                child: Text("ADD", style: TextStyle(
                  fontFamily: FontFamilies.secondary,
                  color: colorScheme.onPrimary,
                  fontSize: fontSize.regular
                ),)),
          )
        ],
      ),
    );
  }

}