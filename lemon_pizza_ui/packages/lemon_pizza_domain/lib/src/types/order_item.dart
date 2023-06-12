
import 'package:lemon_pizza_domain/lemon_pizza_domain.dart';

class OrderItem {
  final PizzaType pizzaType;
  final PizzaSize pizzaSize;
  final int quantity;
  final double pricePerPizza;

  OrderItem({
    required this.pizzaType,
    required this.pizzaSize,
    required this.quantity,
    required this.pricePerPizza,
  });

  double get totalCost => pricePerPizza * quantity;
}