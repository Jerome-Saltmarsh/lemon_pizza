
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lemon_pizza/blocs/order/order_bloc.dart';
import 'package:lemon_pizza/blocs/order/order_enums.dart';
import 'package:lemon_pizza/blocs/order/order_repository.dart';
import 'package:lemon_pizza/ui/common/extensions/build_context_extension.dart';
import 'package:lemon_pizza/ui/desktop/ui/utils/format_dollars.dart';
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

    return SizedBox(
      width: 150,
      height: 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(pizzaType.name, style: TextStyle(fontSize: fontSize.large, color: colorScheme.secondary)),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: pizzaType.ingredients
                .map((ingredient) => Container(
                    margin: const EdgeInsets.only(right: 4),
                    child: Text(ingredient.name,
                        style: TextStyle(fontSize: fontSize.regular, color: colorScheme.tertiary),

                    )))
                .toList(),
          ),
          Text(formatDollars(pizzaPrice), style: TextStyle(fontSize: fontSize.small, color: colorScheme.secondary),),
          const SizedBox(height: 12),
          OnPressed(
            action: () => context.read<OrderBloc>().emitOrderState(
                  selectPizzaType: pizzaType
            ),
            child: Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: colorScheme.primary
                ),
                child: Text("SELECT", style: TextStyle(
                  color: colorScheme.onPrimary,
                  fontSize: fontSize.regular
                ),)),
          )
        ],
      ),
    );
  }

}