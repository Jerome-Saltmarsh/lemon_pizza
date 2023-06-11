

import 'package:lemon_pizza_domain/lemon_pizza_domain.dart';

abstract class OrderRepository {
  Future submitOrder();
  double getPizzaPrice({required PizzaType pizzaType, required PizzaSize pizzaSize});
}