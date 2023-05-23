
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lemon_pizza/order/bloc/order_bloc.dart';
import 'package:lemon_pizza/order/bloc/order_enums.dart';
import 'package:lemon_pizza/order/data/repositories/order_repository.dart';
import 'package:lemon_pizza/utils/format_dollars.dart';
import 'package:lemon_widgets/lemon_widgets.dart';

class SelectPizzaTile extends StatelessWidget {

  final PizzaType pizzaType;

  const SelectPizzaTile(this.pizzaType, {super.key});

  @override
  Widget build(BuildContext context) {

    final orderRepository = RepositoryProvider.of<OrderRepository>(context);
    final pizzaPrice = orderRepository.getPizzaPrice(pizzaType: pizzaType, pizzaSize: PizzaSize.medium);
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return SizedBox(
      width: 150,
      height: 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(pizzaType.name, style: textTheme.titleLarge),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: pizzaType.ingredients
                .map((ingredient) => Container(
                    margin: const EdgeInsets.only(right: 4),
                    child: Text(ingredient.name,
                        style: textTheme.titleSmall,
                    )))
                .toList(),
          ),
          Text(formatDollars(pizzaPrice), style: textTheme.titleSmall,),
          const SizedBox(height: 12),
          OnPressed(
            action: () => context.read<OrderBloc>().emitOrderState(
                  selectPizzaType: pizzaType
            ),
            child: Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1, //                   <--- border width here
                    color: textTheme.titleLarge?.color ?? Colors.black
                  ),
                ),
                child: Text("SELECT", style: textTheme.titleLarge,)),
          )
        ],
      ),
    );
  }

}