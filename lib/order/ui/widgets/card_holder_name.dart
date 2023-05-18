
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:lemon_pizza/order/bloc/order_bloc.dart';

import 'order_bloc_builder.dart';

class CardHolderName extends StatelessWidget {
  const CardHolderName({super.key});

  @override
  Widget build(BuildContext context) {

    final controller = TextEditingController(
        text: context.read<OrderBloc>().state.paymentDetails.cardHolderName?.toString()
    );

    return OrderBlocBuilder(
        buildWhen: (previous, current) =>
        previous.paymentDetails.cardHolderName != current.paymentDetails.cardHolderName ||
            previous.validate != current.validate,
        builder: (context, orderState){
          return TextField(
            controller: controller,
            onChanged: (value){
              context
                  .read<OrderBloc>()
                  .emitPaymentDetails(cardHolderName: value);
            },
            decoration: InputDecoration(
                label: const Text("Card holder name"),
                errorText:
                orderState.validate &&
                    !orderState.paymentDetails.cardHolderNameValid
                    ? 'required' : null
            ),
          );
        });
  }
}