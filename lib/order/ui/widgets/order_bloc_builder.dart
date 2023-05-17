
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lemon_pizza/order/bloc/order_bloc.dart';
import 'package:lemon_pizza/order/bloc/order_state.dart';

class OrderBlocBuilder extends StatelessWidget {

  final BlocBuilderCondition<OrderState>? buildWhen;
  final BlocWidgetBuilder<OrderState> builder;

  const OrderBlocBuilder({super.key, this.buildWhen, required this.builder});

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<OrderBloc, OrderState>(
        bloc: context.read<OrderBloc>(),
        buildWhen: buildWhen,
        builder: builder,
    );

}