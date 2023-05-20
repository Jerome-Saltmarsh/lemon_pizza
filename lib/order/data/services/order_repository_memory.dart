
import 'dart:math';

import 'package:lemon_pizza/order/bloc/order_enums.dart';
import 'package:lemon_pizza/order/data/repositories/order_repository.dart';

class OrderRepositoryMemory implements OrderRepository {

  final random = Random();

  @override
  Future submitOrder() async {
    return Future.delayed(const Duration(seconds: 2), (){
        if (random.nextBool()) throw Exception('Insufficient Funds');
    });
  }

  @override
  double getPizzaPrice({required PizzaType pizzaType, required PizzaSize pizzaSize}) {
    return switch (pizzaType) {
      PizzaType.margherita =>
          switch (pizzaSize) {
           PizzaSize.small => 5.0,
           PizzaSize.medium => 6.0,
           PizzaSize.large => 7.0,
        },
      PizzaType.salami =>
          switch (pizzaSize) {
           PizzaSize.small => 6.0,
           PizzaSize.medium => 7.0,
           PizzaSize.large => 8.0,
        },
      PizzaType.godFather =>
          switch (pizzaSize) {
           PizzaSize.small => 8.0,
           PizzaSize.medium => 9.0,
           PizzaSize.large => 10.0,
        },
      PizzaType.seafood =>
          switch (pizzaSize) {
           PizzaSize.small => 11.0,
           PizzaSize.medium => 13.0,
           PizzaSize.large => 15.0,
        },
       _ => 0.0,
    };
  }
}