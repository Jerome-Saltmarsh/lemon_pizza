import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:golden_ratio/constants.dart';
import 'package:lemon_pizza/order/bloc/order_bloc.dart';
import 'package:lemon_pizza/order/bloc/order_enums.dart';
import 'package:lemon_pizza/order/ui/widgets/order_bloc_builder.dart';
import 'package:lemon_pizza/order/ui/widgets/pizza_size_button.dart';
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
                    border: Border.all(
                      color: Colors.black38,
                    ),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(width: 32),
                          Container(
                              margin: const EdgeInsets.only(left: 16),
                              padding: const EdgeInsets.all(5),
                              child: const Text("Select a size", style: TextStyle(fontSize: 25),)
                          ),
                          Container(
                            width: 32,
                            margin: const EdgeInsets.only(right: 8),
                            child: IconButton(
                                onPressed: context.read<OrderBloc>().cancelSelectPizza,
                                icon: const Icon(Icons.cancel)
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: PizzaSize.values
                            .map((pizzaSize) => PizzaSizeButton(pizzaSize))
                            .toList(),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          const Expanded(child: SizedBox()),
                          OnPressed(
                            action: context.read<OrderBloc>().addSelectedPizza,
                            child: Container(
                              width: 100,
                              height: 100 * goldenRatio_0381,
                              margin: const EdgeInsets.symmetric(horizontal: 16),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text("ADD"),
                                  Icon(Icons.thumb_up),
                                ],
                              ),
                            ),
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