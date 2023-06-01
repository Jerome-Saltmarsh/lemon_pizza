import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_ratio/constants.dart';
import 'package:lemon_pizza/blocs/order/order_bloc.dart';
import 'package:lemon_pizza/blocs/order/order_enums.dart';
import 'package:lemon_pizza/ui/common/extensions/build_context_extension.dart';
import 'package:lemon_pizza/ui/desktop/ui/widgets/buttons/pizza_size_button.dart';
import 'package:lemon_pizza/ui/desktop/ui/widgets/order_bloc_builder.dart';
import 'package:lemon_widgets/lemon_widgets.dart';

class SelectPizzaSizeDialog extends StatelessWidget {
  const SelectPizzaSizeDialog({super.key});

  @override
  Widget build(BuildContext context) =>
      OrderBlocBuilder(builder: (context, orderState) {
        final colorScheme = context.colorScheme;
        final themeState = context.themeState;
        final selectedPizzaType = orderState.selectedPizzaType;
        if (selectedPizzaType == null) return const SizedBox();
        const width = 400.0;
        const blur = 4.0;
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
          child: Stack(
            alignment: Alignment.center,
            children: [
              AnimatePosition(
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeOut,
                side: Side.top,
                start: 0,
                end: 100,
                child: Container(
                  width: width,
                  height: width * goldenRatio_0618,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: context.colorScheme.surfaceVariant,
                    borderRadius: themeState.dialogBorderRadius,
                  ),
                  padding: themeState.dialogPadding,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: PizzaSize.values
                            .map((pizzaSize) => PizzaSizeButton(pizzaSize))
                            .toList(),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                              onPressed: context.read<OrderBloc>().cancelSelectPizza,
                              child: Text("Cancel", style: TextStyle(color: colorScheme.secondary),)
                          ),
                          TextButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                                    (Set<MaterialState> states) {
                                  if (states.contains(MaterialState.disabled)) {
                                    return Colors.grey; // Color when the button is disabled
                                  }
                                  if (states.contains(MaterialState.hovered)){
                                    return colorScheme.inversePrimary;
                                  }
                                  return colorScheme.primary; // Default color
                                },
                              ),
                            ),
                            onPressed: context.read<OrderBloc>().addSelectedPizza,
                            child: Text("CONFIRM", style: TextStyle(color: colorScheme.onPrimary),)
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      });
}