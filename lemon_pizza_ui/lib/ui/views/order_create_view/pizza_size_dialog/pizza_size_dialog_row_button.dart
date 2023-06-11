
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_ratio/constants.dart';
import 'package:lemon_pizza/blocs/select/select_bloc.dart';
import 'package:lemon_pizza/ui/extensions/build_context_extension.dart';
import 'package:lemon_pizza/ui/functions/format_dollars.dart';
import 'package:lemon_pizza/ui/views/order_create_view/pizza_size_dialog/pizza_size_image.dart';
import 'package:lemon_pizza_model/lemon_pizza_model.dart';
import 'package:lemon_widgets/lemon_widgets.dart';

class PizzaSizeDialogRowButton extends StatelessWidget {

  final PizzaSize pizzaSize;

  const PizzaSizeDialogRowButton({super.key, required this.pizzaSize});

  @override
  Widget build(BuildContext context) {
    final selectionBloc = context.watch<SelectBloc>();
    final selectionState = selectionBloc.state;
    final selectedPizzaType = selectionState.pizzaType;
    if (selectedPizzaType == null) {
      return const Text("Pizza type is missing");
    }

    final themeState = context.readThemeState;
    final colorScheme = context.colorScheme;
    final fontSize = context.fontSize;
    const height = 200.0;
    final isSelected = selectionBloc.state.pizzaSize == pizzaSize;

    return OnPressed(
      action: () => selectionBloc.selectPizzaSize(pizzaSize),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        height: height,
        width:  height * goldenRatio_0618,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          borderRadius: themeState.dialogBorderRadius,
          color: isSelected ? colorScheme.primary : colorScheme.secondary,
        ),
        padding: themeState.dialogPadding,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(pizzaSize.name.toUpperCase(), style: TextStyle(
                fontFamily: 'CabinSketch',
                fontSize: fontSize.large,
                color: isSelected ? colorScheme.onPrimary : colorScheme.onSecondary
            )),
            Text(
                formatDollars(context.orderRepository.getPizzaPrice(
                  pizzaType: selectedPizzaType,
                  pizzaSize: pizzaSize,
                )),
                style: TextStyle(
                    fontSize: fontSize.regular,
                    color: isSelected ? colorScheme.onPrimary : colorScheme.onSecondary
                )
            ),
            const SizedBox(height: 8,),
            Container(
                height: 75,
                width: 225.0 * getIconSize(pizzaSize) * 0.2,
                alignment: Alignment.center,
                child: const PizzaSizeImage()
            ),
          ],
        ),
      ),
    );
  }

  double getIconSize(PizzaSize pizzaSize) {
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