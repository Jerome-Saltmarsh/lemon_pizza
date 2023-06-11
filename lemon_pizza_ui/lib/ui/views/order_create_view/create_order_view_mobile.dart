
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lemon_pizza_ui/blocs/select/select_bloc.dart';

import 'pizza_size_dialog/pizza_size_dialog.dart';
import 'pizza_type/pizza_type_column/pizza_type_column.dart';

class CreateOrderViewMobile extends StatelessWidget {
  const CreateOrderViewMobile({super.key});

  @override
  Widget build(BuildContext context) {
      final selectState = context.watch<SelectBloc>().state;
      return Stack(children: [
          const PizzaTypeColumn(),
            if (selectState.pizzaType != null)
          const PizzaSizeDialog(),
      ],);
  }
}