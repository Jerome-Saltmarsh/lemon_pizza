
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lemon_pizza/blocs/select/select_bloc.dart';
import 'package:lemon_pizza/model/pizza_size.dart';
import 'package:lemon_pizza/model/pizza_type.dart';
import 'package:lemon_pizza/ui/extensions/build_context_extension.dart';
import 'package:lemon_pizza/ui/functions/format_dollars.dart';
import 'package:lemon_widgets/lemon_widgets.dart';

class PizzaTypeColumnItem extends StatelessWidget {

  final PizzaType pizzaType;

  const PizzaTypeColumnItem({super.key, required this.pizzaType});

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    final fontSize = context.fontSize;
    final orderRepository = context.orderRepository;
    final pizzaPrice = orderRepository.getPizzaPrice(pizzaType: pizzaType, pizzaSize: PizzaSize.medium);

    final pizzaName = Text(pizzaType.name, style: TextStyle(fontSize: fontSize.large, color: colorScheme.secondary));
    final price = Text(formatDollars(pizzaPrice), style: TextStyle(
      fontSize: fontSize.regular,
      color: colorScheme.onSecondaryContainer,
    ));

    final ingredients = Text(pizzaType.ingredients.map((ingredient) => ingredient.name).reduce((previousValue, element) => '$previousValue, $element'),
      style: TextStyle(
        fontSize: fontSize.regular,
        color: colorScheme.tertiary,
      ),
    );

    final addButton = TextButton(
      onPressed: () => context.read<SelectBloc>().selectPizzaType(pizzaType),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
            return colorScheme.tertiaryContainer; // Default color
          },
        ),
      ),
      child: Text("ADD", style: TextStyle(
          fontFamily: 'CabinSketch',
          color: colorScheme.onTertiaryContainer, fontSize: fontSize.regular),),
    );

    return ListTile(
      title: price,
      leading: SizedBox(
          width: 90,
          child: pizzaName),
      subtitle: ingredients,
      trailing: addButton,
    );

  }

}