
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lemon_pizza/blocs/select/select_bloc.dart';
import 'package:lemon_pizza/ui/font_families.dart';
import 'package:lemon_pizza/ui/extensions/build_context_extension.dart';
import 'package:lemon_pizza/ui/functions/format_dollars.dart';
import 'package:lemon_pizza_domain/lemon_pizza_domain.dart';
import 'package:lemon_widgets/lemon_widgets.dart';

class PizzaSizeDialogColumn extends StatelessWidget {
  const PizzaSizeDialogColumn({super.key});

  @override
  Widget build(BuildContext context) {
    final selectBloc = context.watch<SelectBloc>();
    final selectState = selectBloc.state;
    final selectedPizzaType = selectState.pizzaType;
    final selectedPizzaSize = selectState.pizzaSize;
    final themeState = context.readThemeState;
    final colorScheme = context.colorScheme;
    final fontSize = context.fontSize;

    if (selectedPizzaType == null){
      return const SizedBox();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: PizzaSize.values.map((pizzaSize) {
      final cost = context.orderRepository.getPizzaPrice(pizzaType: selectedPizzaType, pizzaSize: pizzaSize);

      final isSelected = selectedPizzaSize == pizzaSize;
      return OnPressed(
        action: () => selectBloc.selectPizzaSize(pizzaSize),
        child: AnimatedContainer(
          height: 70,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          padding: context.readThemeState.dialogPadding,
          constraints: const BoxConstraints(
            maxWidth: 250,
          ),
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: themeState.dialogBorderRadius,
            color: isSelected ? colorScheme.primary : colorScheme.secondary,
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(pizzaSize.name.toUpperCase(), style: TextStyle(
                    fontFamily: 'CabinSketch',
                    fontSize: fontSize.large,
                    color: isSelected ? colorScheme.onPrimary : colorScheme.onSecondary
                )),
              ),
              Text(formatDollars(cost), style: TextStyle(
                fontFamily: FontFamilies.roboto,
                fontSize: context.fontSize.large,
                  color: isSelected ? colorScheme.onPrimary : colorScheme.onSecondary
              )),
            ],
          ),
        ),
      );
    }).toList(),);
  }
}