import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lemon_pizza_domain/lemon_pizza_domain.dart';
import 'package:lemon_pizza_ui/blocs/order/order_repository.dart';
import 'package:lemon_pizza_ui/blocs/select/select_bloc.dart';
import 'package:lemon_pizza_ui/ui/extensions/build_context_extension.dart';
import 'package:lemon_pizza_ui/ui/functions/format_dollars.dart';
import 'package:lemon_pizza_ui/ui/functions/map_ingredients_to_string.dart';
import 'package:lemon_widgets/lemon_widgets.dart';

class PizzaTypeGridTile extends StatelessWidget {
  final PizzaType pizzaType;

  const PizzaTypeGridTile({super.key, required this.pizzaType});

  @override
  Widget build(BuildContext context) {
    final fontSize = context.fontSize;
    final orderRepository = RepositoryProvider.of<OrderRepository>(context);
    final pizzaPrice = orderRepository.getPizzaPrice(
        pizzaType: pizzaType, pizzaSize: PizzaSize.medium);
    final colorScheme = context.colorScheme;
    final themeState = context.readThemeState;
    const width = 200.0;
    final priceText = Text(formatDollars(pizzaPrice),
        style: TextStyle(
            fontSize: fontSize.small, color: colorScheme.onPrimaryContainer));
    final pizzaTypeText = Text(pizzaType.name,
        style:
            TextStyle(fontSize: fontSize.large, color: colorScheme.tertiary));

    return Container(
      width: width,
      height: width,
      margin: const EdgeInsets.only(left: 8, top: 16, right: 8),
      padding: themeState.dialogPadding,
      decoration: BoxDecoration(
        color: colorScheme.secondaryContainer,
        borderRadius: themeState.dialogBorderRadius,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              pizzaTypeText,
              priceText,
            ],
          ),
          Text(
            mapIngredientsToString(pizzaType.ingredients),
            style: TextStyle(
                fontSize: fontSize.regular,
                color: colorScheme.onSecondaryContainer,
                fontStyle: FontStyle.italic),
          ),
          // Text(formatDollars(pizzaPrice), style: TextStyle(fontSize: fontSize.small, color: colorScheme.secondary),),
          const Expanded(child: SizedBox()),
          OnPressed(
            action: () => context.read<SelectBloc>().selectPizzaType(pizzaType),
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: colorScheme.primary,
                borderRadius: context.readThemeState.dialogBorderRadius,
              ),
              child: Icon(
                Icons.add,
                color: colorScheme.onPrimary,
              ),
            ),
          )
        ],
      ),
    );
  }
}
