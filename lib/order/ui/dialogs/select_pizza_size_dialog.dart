import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:golden_ratio/constants.dart';
import 'package:lemon_pizza/order/bloc/order_bloc.dart';
import 'package:lemon_pizza/order/bloc/order_enums.dart';
import 'package:lemon_pizza/order/ui/widgets/order_bloc_builder.dart';
import 'package:lemon_pizza/order/ui/widgets/pizza_size_button.dart';
import 'package:lemon_pizza/style.dart';
import 'package:lemon_widgets/lemon_widgets.dart';

class SelectPizzaSizeDialog extends StatelessWidget {
  const SelectPizzaSizeDialog({super.key});

  @override
  Widget build(BuildContext context) =>
      OrderBlocBuilder(builder: (context, orderState) {
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
                    color: context.theme.dialogBackgroundColor,
                    borderRadius: Style.dialogBorderRadius,
                    border: Border.all(
                      color: context.theme.highlightColor
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.end,
                      //   children: [
                      //     // const SizedBox(width: 32),
                      //     // Container(
                      //     //     margin: const EdgeInsets.only(left: 16),
                      //     //     padding: const EdgeInsets.all(5),
                      //     //     child: Text("Select a size", style: context.textTheme.titleLarge)
                      //     // ),
                      //     Container(
                      //       width: 32,
                      //       margin: const EdgeInsets.only(right: 8),
                      //       child: IconButton(
                      //           onPressed: context.read<OrderBloc>().cancelSelectPizza,
                      //           icon: const Icon(Icons.cancel)
                      //       ),
                      //     ),
                      //   ],
                      // ),
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
                              child: const Text("Cancel")
                          ),
                          TextButton(
                            onPressed: context.read<OrderBloc>().addSelectedPizza,
                            child: const Text("CONFIRM")
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