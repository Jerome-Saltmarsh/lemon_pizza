
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lemon_pizza_domain/lemon_pizza_domain.dart';
import 'package:lemon_pizza_ui/blocs/order/order_bloc.dart';

class OrderBlocBuilder extends StatelessWidget {

  final BlocBuilderCondition<Order>? buildWhen;
  final BlocWidgetBuilder<Order> builder;

  const OrderBlocBuilder({super.key, this.buildWhen, required this.builder});

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<OrderBloc, Order>(
        buildWhen: buildWhen,
        builder: builder,
    );
}