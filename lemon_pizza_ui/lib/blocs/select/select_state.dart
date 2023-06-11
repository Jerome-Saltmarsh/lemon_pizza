


import 'package:lemon_pizza_model/lemon_pizza_model.dart';

class SelectState {
  final PizzaType? pizzaType;
  final PizzaSize pizzaSize;
  SelectState({this.pizzaType, required this.pizzaSize});

  SelectState copyWith({PizzaType? pizzaType, PizzaSize? pizzaSize}){
    return SelectState(
       pizzaType: pizzaType ?? this.pizzaType,
       pizzaSize: pizzaSize ?? this.pizzaSize,
    );
  }
}