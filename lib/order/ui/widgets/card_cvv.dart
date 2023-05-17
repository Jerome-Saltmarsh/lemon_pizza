import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lemon_pizza/order/bloc/order_bloc.dart';
import 'package:lemon_pizza/order/ui/widgets/order_bloc_builder.dart';

class CardCvv extends StatelessWidget {
  const CardCvv({super.key});

  @override
  Widget build(BuildContext context) => OrderBlocBuilder(
      buildWhen: (previous, current) =>
          previous.paymentDetails.cvv != current.paymentDetails.cvv ||
          previous.validate != current.validate,
      builder: (context, orderState) {
        final paymentDetails = orderState.paymentDetails;
        return TextField(
            decoration: InputDecoration(
                errorText: orderState.validate && !paymentDetails.cvvValid
                    ? 'invalid'
                    : null),
            controller: TextEditingController(
                text: orderState.paymentDetails.cvv?.toString() ?? ''
            ),
            onChanged: (cvv) {
              context
                  .read<OrderBloc>()
                  .emitPaymentDetails(cvv: int.tryParse(cvv));
            });
      });
}
