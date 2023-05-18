import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lemon_pizza/order/bloc/order_bloc.dart';
import 'package:lemon_pizza/order/ui/widgets/order_bloc_builder.dart';

class CardNumber extends StatelessWidget {
  const CardNumber({super.key});

  @override
  Widget build(BuildContext context) {

    final controller = TextEditingController(
        text: context.read<OrderBloc>().state.paymentDetails.cardNumber?.toString()
    );

    return OrderBlocBuilder(
        buildWhen: (previous, current) =>
            previous.paymentDetails.cardNumber != current.paymentDetails.cardNumber ||
            previous.validate != current.validate,
        builder: (context, orderState){
         return TextField(
             controller: controller,
             onChanged: (value){
               context
                   .read<OrderBloc>()
                   .emitPaymentDetails(cardNumber: int.tryParse(value));
             },
             decoration: InputDecoration(
                label: const Text("Card Number"),
                errorText:
                    orderState.validate &&
                    !orderState.paymentDetails.cardNumberValid
                        ? 'invalid' : null
             ),
         );
    });
  }

}