
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lemon_pizza/blocs/order/order_bloc.dart';
import 'package:lemon_pizza/blocs/order/order_state.dart';

class OrderValidateBuilder extends StatelessWidget {
  final Widget Function(BuildContext context, bool valid) builder;

  const OrderValidateBuilder({required this.builder, super.key});

  @override
  Widget build(BuildContext context) => BlocBuilder<OrderBloc, OrderState>(
      bloc: context.read<OrderBloc>(),
      buildWhen: (previousOrderState, currentOrderState) =>
          previousOrderState.validate != currentOrderState.validate,
      builder: (context, orderState) =>
          builder(context, orderState.validate)
  );
}
