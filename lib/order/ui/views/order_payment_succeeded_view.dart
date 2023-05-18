
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lemon_pizza/order/bloc/order_bloc.dart';

class PaymentSucceededView extends StatelessWidget {
  const PaymentSucceededView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Text("PAYMENT SUCCEEDED"),
          TextButton(onPressed: context.read<OrderBloc>().restart,child: const Text("RESTART"))
        ],
      ),
    );
  }
}