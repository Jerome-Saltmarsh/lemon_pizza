import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:lemon_pizza/order/bloc/order_bloc.dart';
import 'package:lemon_pizza/order/bloc/order_enums.dart';
import 'package:lemon_pizza/order/ui/widgets/order_bloc_builder.dart';
import 'package:lemon_pizza/order/ui/widgets/pizza_size_button.dart';

class SelectPizzaSizeDialog extends StatelessWidget {
  const SelectPizzaSizeDialog({super.key});

  @override
  Widget build(BuildContext context) =>
      OrderBlocBuilder(builder: (context, orderState) {
        final selectedPizzaType = orderState.selectedPizzaType;
        if (selectedPizzaType == null) return const SizedBox();
        return Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white70,
          alignment: Alignment.center,
          child: Container(
            width: 300,
            height: 200,
            color: Colors.blue,
            child: Column(
              children: [
                Text(selectedPizzaType.name),
                const Text("SELECT PIZZA SIZE"),
                Row(
                  children: PizzaSize.values
                      .map((pizzaSize) => PizzaSizeButton(pizzaSize))
                      .toList(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: context.read<OrderBloc>().cancelSelectPizza,
                        icon: const Icon(Icons.cancel)
                    ),
                    IconButton(
                        onPressed: context.read<OrderBloc>().addSelectedPizza,
                        icon: const Icon(Icons.thumb_up)
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      });
}