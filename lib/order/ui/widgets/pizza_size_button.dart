import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_ratio/constants.dart';
import 'package:lemon_pizza/order/bloc/order_bloc.dart';
import 'package:lemon_pizza/order/bloc/order_enums.dart';
import 'package:lemon_pizza/order/data/repositories/order_repository.dart';
import 'package:lemon_pizza/order/ui/extensions/string_extensions.dart';
import 'package:lemon_pizza/order/ui/widgets/images/pizza_image.dart';
import 'package:lemon_pizza/order/ui/widgets/order_bloc_builder.dart';
import 'package:lemon_pizza/utils/format_dollars.dart';
import 'package:lemon_widgets/lemon_widgets.dart';

class PizzaSizeButton extends StatelessWidget {
  final PizzaSize pizzaSize;

  const PizzaSizeButton(this.pizzaSize, {super.key});

  @override
  Widget build(BuildContext context) {
    return OrderBlocBuilder(buildWhen: (previous, current) {
      return previous.selectedPizzaSize != current.selectedPizzaSize ||
          previous.selectedPizzaType != current.selectedPizzaType;
    }, builder: (context, orderState) {
      final selectedPizzaType = orderState.selectedPizzaType;
      final isSelected = orderState.selectedPizzaSize == pizzaSize;
      if (selectedPizzaType == null) {
        throw Exception('selectedPizzaType == null');
      }

      const height = 145.0;

      return OnPressed(
        action: () {
          context.read<OrderBloc>().emitOrderState(selectPizzaSize: pizzaSize);
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          height: height,
          width:  height * goldenRatio_0618,
          color: isSelected ? context.theme.colorScheme.onSecondaryContainer : context.theme.colorScheme.secondary,
          child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
              ),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(pizzaSize.name.capitalizeFirstLetter, style: context.textTheme.titleMedium),
                  SizedBox(
                      width: 225.0 * iconSize * 0.2,
                      child: const PizzaImage()
                  ),
                  Text(formatDollars(
                      RepositoryProvider.of<OrderRepository>(context)
                          .getPizzaPrice(
                            pizzaType: selectedPizzaType,
                            pizzaSize: pizzaSize,
                      )
                  ),
                      style: context.textTheme.labelMedium
                  ),
                ],
              )),
        ),
      );
    });
  }

  double get iconSize {
    switch (pizzaSize) {
      case PizzaSize.small:
        return 1.0;
      case PizzaSize.medium:
        return goldenRatio_1381;
      case PizzaSize.large:
        return goldenRatio_1618;
    }
  }
}
