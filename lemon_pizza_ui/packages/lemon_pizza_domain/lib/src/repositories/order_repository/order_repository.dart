
import 'package:lemon_pizza_domain/lemon_pizza_domain.dart';

abstract class OrderRepository {
  Future<OrderRepositorySubmitResponse> createOrder(Order order);

  double getPizzaPrice({required PizzaType pizzaType, required PizzaSize pizzaSize});
}

