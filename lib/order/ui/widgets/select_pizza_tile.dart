
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lemon_pizza/order/bloc/order_bloc.dart';
import 'package:lemon_pizza/order/bloc/order_enums.dart';

class SelectPizzaTile extends StatelessWidget {

  final PizzaType pizzaType;

  const SelectPizzaTile(this.pizzaType, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(pizzaType.name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: pizzaType.ingredients.map((e) => Container(margin: const EdgeInsets.only(right: 4),child: Text(e.name),)).toList(),
          ),
          Text("\$${pizzaType.priceMedium.toStringAsFixed(2)}"),
          const SizedBox(height: 12),
          GestureDetector(
            onTap: (){
              context.read<OrderBloc>().emitOrderState(
                  selectPizzaType: pizzaType
              );
              // context.read<OrderBloc>().addOrderItem(
              //     OrderItem(pizzaType: pizzaType, pizzaSize: PizzaSize.regular)
              // );
            },
            child: Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1, //                   <--- border width here
                  ),
                ),
                child: const Text("SELECT")),
          )
        ],
      ),
    );
  }

}