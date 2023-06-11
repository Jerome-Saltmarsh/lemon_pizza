
import 'dart:math';

import 'package:lemon_pizza/blocs/order/order_repository.dart';
import 'package:lemon_pizza_model/lemon_pizza_model.dart';

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
      PizzaType.vegetarian =>
          switch (pizzaSize) {
           PizzaSize.small => 7.0,
           PizzaSize.medium => 8.0,
           PizzaSize.large => 9.0,
        },
      PizzaType.godfather =>
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
        }
    };
  }
}