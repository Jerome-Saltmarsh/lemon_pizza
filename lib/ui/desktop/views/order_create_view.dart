
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_ratio/constants.dart';
import 'package:lemon_pizza/blocs/order/order_bloc.dart';
import 'package:lemon_pizza/blocs/order/order_enums.dart';
import 'package:lemon_pizza/blocs/order/order_repository.dart';
import 'package:lemon_pizza/ui/common/extensions/build_context_extension.dart';
import 'package:lemon_pizza/ui/common/font_families.dart';
import 'package:lemon_pizza/ui/common/functions/format_dollars.dart';
import 'package:lemon_pizza/ui/common/functions/map_ingredients_to_string.dart';
import 'package:lemon_pizza/ui/desktop/dialogs/orders_dialog.dart';
import 'package:lemon_pizza/ui/desktop/images/pizza_image.dart';
import 'package:lemon_pizza/ui/desktop/widgets/order_bloc_builder.dart';
import 'package:lemon_widgets/lemon_widgets.dart';


class CreateOrderView extends StatefulWidget {

  const CreateOrderView({super.key});

  @override
  State<CreateOrderView> createState() => _CreateOrderViewState();
}

class _CreateOrderViewState extends State<CreateOrderView> {

  PizzaType? selectedPizzaType;
  var selectedPizzaSize = PizzaSize.medium;

  Widget buildGridViewPizzaType() {
    return SizedBox(
      width: 400,
      child: GridView.count(
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          children: PizzaType.values.map(buildTilePizzaType).toList()
      ),
    );
  }

  Widget buildTilePizzaType(PizzaType pizzaType){
    final fontSize = context.fontSize;
    final orderRepository = RepositoryProvider.of<OrderRepository>(context);
    final pizzaPrice = orderRepository.getPizzaPrice(pizzaType: pizzaType, pizzaSize: PizzaSize.medium);
    final colorScheme = context.colorScheme;
    const width = 150.0;

    return Container(
      width: width,
      height: width * goldenRatio_0618,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(pizzaType.name, style: TextStyle(fontSize: fontSize.large, color: colorScheme.secondary)),
              Container(
                  width: 60,
                  alignment: Alignment.center,
                  color: colorScheme.primaryContainer,
                  padding: const EdgeInsets.all(2),
                  child: Text(formatDollars(pizzaPrice), style: TextStyle(fontSize: fontSize.small, color: colorScheme.onPrimaryContainer))),
            ],
          ),
          Text(mapIngredientsToString(pizzaType.ingredients),
            style: TextStyle(fontSize: fontSize.regular, color: colorScheme.tertiary),

          ),
          // Text(formatDollars(pizzaPrice), style: TextStyle(fontSize: fontSize.small, color: colorScheme.secondary),),
          const SizedBox(height: 12),
          OnPressed(
            action: (){
              setState(() {
                selectedPizzaType = pizzaType;
              });
            },
            child: Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                    color: colorScheme.primary
                ),
                child: Text("ADD", style: TextStyle(
                    fontFamily: FontFamilies.secondary,
                    color: colorScheme.onPrimary,
                    fontSize: fontSize.regular
                ),)),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) => Stack(
      alignment: Alignment.center,
      children: [
        Container(
            margin: const EdgeInsets.only(top: 16),
            width: double.infinity,
            alignment: Alignment.topCenter,
            child: buildGridViewPizzaType(),
        ),
        if (context.watch<OrderBloc>().state.orderItems.isNotEmpty)
        const Positioned(
            top: 16,
            right: 16,
            child: OrdersDialog(),
        ),
        if (selectedPizzaType != null)
            buildDialogSelectPizzaSize(),
      ],
    );

  Widget buildPizzaSizeButton(PizzaSize pizzaSize){
    assert (selectedPizzaType != null);
    final themeState = context.readThemeState;
    final colorScheme = context.colorScheme;
    final fontSize = context.fontSize;
    const height = 200.0;
    final isSelected = selectedPizzaSize == pizzaSize;

    return OnPressed(
      action: () {
        setState(() {
          selectedPizzaSize = pizzaSize;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        height: height,
        width:  height * goldenRatio_0618,
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
                  pizzaType: selectedPizzaType!, // todo
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
                child: const PizzaImage()
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDialogSelectPizzaSize() =>
      OrderBlocBuilder(builder: (context, orderState) {
        final colorScheme = context.colorScheme;
        final themeState = context.readThemeState;
        const width = 460.0;
        const blur = 4.0;
        assert (selectedPizzaType != null);
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
                            .map(buildPizzaSizeButton)
                            .toList(),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                              onPressed: (){
                                setState(() {
                                  selectedPizzaType = null;
                                });
                              },
                              child: Text(
                                "Cancel", style: TextStyle(
                                  fontFamily: FontFamilies.secondary,
                                  color: colorScheme.secondary),)
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
                              onPressed: (){
                                context.read<OrderBloc>().addPizza(pizzaType: selectedPizzaType!, pizzaSize: selectedPizzaSize);
                                setState(() {
                                  selectedPizzaType = null;
                                });
                              },
                              child: Text("CONFIRM", style: TextStyle(
                                  fontFamily: FontFamilies.secondary,
                                  color: colorScheme.onPrimary),)
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

  static double getIconSize(PizzaSize pizzaSize) {
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