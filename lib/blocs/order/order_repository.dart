
import 'package:lemon_pizza/model/pizza_size.dart';
import 'package:lemon_pizza/model/pizza_type.dart';

abstract class OrderRepository {
  Future submitOrder();
  double getPizzaPrice({required PizzaType pizzaType, required PizzaSize pizzaSize});
}