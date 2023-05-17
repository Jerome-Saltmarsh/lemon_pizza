
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lemon_pizza/order/bloc/order_bloc.dart';

class PaymentFailedView extends StatelessWidget {
  const PaymentFailedView({super.key});

  @override
  Widget build(BuildContext context) => Column(
      children: [
        const Text("PAYMENT FAILED"),
        TextButton(
          onPressed: context.read<OrderBloc>().next,
          child: const Text("TRY AGAIN"),
        ),
      ],
    );
}