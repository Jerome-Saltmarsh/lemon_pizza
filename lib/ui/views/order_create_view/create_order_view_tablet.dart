
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lemon_pizza/blocs/select/select_bloc.dart';
import 'package:lemon_pizza/ui/views/order_create_view/order_items_dialog/orders_column.dart';
import 'package:lemon_pizza/ui/views/order_create_view/pizza_type_column/pizza_type_column.dart';

class CreateOrderViewTablet extends StatelessWidget {
  const CreateOrderViewTablet({super.key});

  @override
  Widget build(BuildContext context) {
    final selectState = context.watch<SelectBloc>().state;
    return Row(children: [
      const SizedBox(
          width: 400,
          child: PizzaTypeColumn()),
      const OrdersColumn(),
    ],);
  }

}