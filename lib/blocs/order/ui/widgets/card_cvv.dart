import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lemon_pizza/blocs/order/order_bloc.dart';
import 'package:lemon_pizza/blocs/order/ui/constants/numbers_only_formatter.dart';

import 'order_bloc_builder.dart';

class CardCvv extends StatelessWidget {
  const CardCvv({super.key});

  @override
  Widget build(BuildContext context) {

    final controller = TextEditingController(
        text: context.read<OrderBloc>().state.paymentDetails.cvv?.toString()
    );

    return OrderBlocBuilder(
      buildWhen: (previous, current) =>
          previous.paymentDetails.cvv != current.paymentDetails.cvv ||
          previous.validate != current.validate,
      builder: (context, orderState) {
        final paymentDetails = orderState.paymentDetails;
        return SizedBox(
          width: 50,
          child: TextField(
              maxLength: 3,
              maxLengthEnforcement: MaxLengthEnforcement.enforced,
              keyboardType: TextInputType.number,
              inputFormatters: [numbersOnlyFormatter],
              decoration: InputDecoration(
                  counterText: '',
                  label: const Text("cvv"),
                  errorText: orderState.validate && !paymentDetails.cvvValid
                      ? 'invalid'
                      : null
              ),
              controller: controller,
              onChanged: (cvv) {
                context
                    .read<OrderBloc>()
                    .emitPaymentDetails(cvv: int.tryParse(cvv));
              }),
        );
      });
  }
}
