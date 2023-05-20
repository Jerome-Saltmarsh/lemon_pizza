
import 'package:lemon_pizza/order/bloc/order_enums.dart';

abstract class OrderRepository {
  Future submitOrder();
  double getPizzaPrice({required PizzaType pizzaType, required PizzaSize pizzaSize});
}