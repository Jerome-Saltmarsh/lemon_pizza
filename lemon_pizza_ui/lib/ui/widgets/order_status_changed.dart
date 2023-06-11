import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lemon_pizza/blocs/order/order_bloc.dart';
import 'package:lemon_pizza/blocs/order/order_state.dart';
import 'package:lemon_pizza_domain/lemon_pizza_domain.dart';

class OrderStatusChanged extends StatelessWidget {
  final Widget Function(BuildContext context, OrderStatus orderStatus) builder;

  const OrderStatusChanged(this.builder, {super.key});

  @override
  Widget build(BuildContext context) => BlocBuilder<OrderBloc, OrderState>(
        bloc: context.read<OrderBloc>(),
        buildWhen: (previousOrderState, currentOrderState) =>
            previousOrderState.orderStatus != currentOrderState.orderStatus,
        builder: (context, orderState) =>
            builder(context, orderState.orderStatus)
  );
}

