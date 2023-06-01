import 'package:flutter/material.dart';
import 'package:golden_ratio/constants.dart';
import 'package:lemon_pizza/order/bloc/order_enums.dart';
import 'package:lemon_pizza/order/ui/extensions/build_context_extensions.dart';
import 'package:lemon_pizza/order/ui/widgets/images/pizza_image.dart';
import 'package:lemon_pizza/order/ui/widgets/order_bloc_builder.dart';
import 'package:lemon_pizza/style.dart';
import 'package:lemon_pizza/utils/format_dollars.dart';
import 'package:lemon_widgets/lemon_widgets.dart';

class PizzaSizeButton extends StatelessWidget {
  final PizzaSize pizzaSize;

  const PizzaSizeButton(this.pizzaSize, {super.key});

  @override
  Widget build(BuildContext context) {

    final colorScheme = context.colorScheme;

    return OrderBlocBuilder(buildWhen: (previous, current) {
      return previous.selectedPizzaSize != current.selectedPizzaSize ||
          previous.selectedPizzaType != current.selectedPizzaType;
    }, builder: (context, orderState) {
      final selectedPizzaType = orderState.selectedPizzaType;
      final isSelected = orderState.selectedPizzaSize == pizzaSize;
      if (selectedPizzaType == null) {
        throw Exception('selectedPizzaType == null');
      }

      const height = 155.0;

      return OnPressed(
        action: () => context.selectPizzaSize(pizzaSize),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          height: height,
          width:  height * goldenRatio_0618,
          decoration: BoxDecoration(
            borderRadius: Style.dialogBorderRadius,
            color: isSelected ? colorScheme.primary : colorScheme.background,
          ),
          padding: Style.dialogPadding,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(pizzaSize.name.toUpperCase(), style: TextStyle(
                fontSize: FontSize.large,
                color: isSelected ? colorScheme.onPrimary : colorScheme.primary
              )),
              Text(
                  formatDollars(context.orderRepository.getPizzaPrice(
                    pizzaType: selectedPizzaType,
                    pizzaSize: pizzaSize,
                  )),
                  style: TextStyle(
                      fontSize: FontSize.regular,
                      color: isSelected ? colorScheme.onPrimary : colorScheme.primary
                  )
              ),
              const SizedBox(height: 8,),
              Container(
                  height: 75,
                  width: 225.0 * iconSize * 0.2,
                  alignment: Alignment.center,
                  child: const PizzaImage()
              ),
            ],
          ),
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
