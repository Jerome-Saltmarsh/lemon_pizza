

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lemon_pizza_domain/lemon_pizza_domain.dart';
import 'package:lemon_pizza_ui/blocs/order/order_bloc.dart';

class PaymentDetailsBuilder extends StatelessWidget {

  final Function(BuildContext context, PaymentDetails paymentDetails) builder;

  const PaymentDetailsBuilder({super.key, required this.builder});

  @override
  Widget build(BuildContext context) => BlocBuilder<OrderBloc, Order>(
      buildWhen: (previous, current) => previous.paymentDetails != current.paymentDetails,
      builder: (context, order)=> builder(context, order.paymentDetails)
  );

}