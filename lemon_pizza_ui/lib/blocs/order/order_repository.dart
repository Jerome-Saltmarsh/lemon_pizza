

import 'package:lemon_pizza_model/lemon_pizza_model.dart';

abstract class OrderRepository {
  Future submitOrder();
  double getPizzaPrice({required PizzaType pizzaType, required PizzaSize pizzaSize});
}