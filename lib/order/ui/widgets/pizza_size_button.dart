

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_ratio/constants.dart';
import 'package:lemon_pizza/order/bloc/order_bloc.dart';
import 'package:lemon_pizza/order/bloc/order_enums.dart';
import 'package:lemon_pizza/widgets/on_pressed.dart';
import 'package:lemon_pizza/order/ui/widgets/order_bloc_builder.dart';
import 'package:lemon_pizza/utils/format_dollars.dart';

class PizzaSizeButton extends StatelessWidget {

  final PizzaSize pizzaSize;

  const PizzaSizeButton(this.pizzaSize, {super.key});

  @override
  Widget build(BuildContext context) {

    return OrderBlocBuilder(
        buildWhen: (previous, current){
           return previous.selectedPizzaSize != current.selectedPizzaSize ||
               previous.selectedPizzaType != current.selectedPizzaType;
        },
        builder: (context, orderState) {
          final selectedPizzaType = orderState.selectedPizzaType;
          if (selectedPizzaType == null) {
            throw Exception('selectedPizzaType == null');
          }


          const width = 135.0;
          return OnPressed(
            action: (){
              context
                  .read<OrderBloc>()
                  .emitOrderState(selectPizzaSize: pizzaSize);
            },
            child: Container(
              padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: orderState.selectedPizzaSize == pizzaSize
                  ? Colors.green
                  : Colors.black12,
              borderRadius: BorderRadius.circular(4),
            ),
            height: width ,
            width: width * goldenRatio_0618,
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Text(pizzaSize.name),
                    Container(
                        width: 80,
                        height: 80,
                        alignment: Alignment.center,
                        child: Icon(Icons.donut_small, size: iconSize)),
                    Text(formatDollars(selectedPizzaType.getPriceForSize(pizzaSize))),
                  ],
                )),
          );
        }
    );
  }

  double get iconSize {
     switch(pizzaSize){
       case PizzaSize.small:
         return 30.0;
       case PizzaSize.medium:
         return 40.0;
       case PizzaSize.large:
         return 50.0;
     }
  }
}