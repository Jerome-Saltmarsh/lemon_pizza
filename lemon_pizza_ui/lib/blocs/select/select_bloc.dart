
import 'package:bloc/bloc.dart';
import 'package:lemon_pizza_model/lemon_pizza_model.dart';

import 'select_state.dart';

class SelectBloc extends Cubit<SelectState>{
  SelectBloc() : super(SelectState(pizzaSize: PizzaSize.medium));

  void selectPizzaSize(PizzaSize pizzaSize) =>
      emit(state.copyWith(pizzaSize: pizzaSize));

  void selectPizzaType(PizzaType pizzaType) =>
      emit(state.copyWith(pizzaType: pizzaType));

  void clearPizzaType(){
      emit(SelectState(pizzaSize: state.pizzaSize));
  }
}