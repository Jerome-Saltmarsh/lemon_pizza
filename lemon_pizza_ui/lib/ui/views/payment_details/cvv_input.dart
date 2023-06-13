

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lemon_pizza_ui/blocs/order/order_bloc.dart';
import 'package:lemon_pizza_ui/ui/formatters/numbers_only_formatter.dart';
import 'package:lemon_widgets/lemon_widgets.dart';

import 'build_input_decoration.dart';
import 'payment_details_builder.dart';

class CvvInput extends StatelessWidget {
  const CvvInput({super.key});

  @override
  Widget build(BuildContext context) => PaymentDetailsBuilder(
      builder: (context, paymentDetails) => SizedBox(
          width: 80,
          child: TextFormField(
            initialValue: paymentDetails.cvv,
            maxLength: 3,
            cursorColor: context.colorScheme.secondary,
            maxLengthEnforcement: MaxLengthEnforcement.enforced,
            keyboardType: TextInputType.number,
            inputFormatters: [InputFormatters.numbersOnlyFormatter],
            decoration: buildInputDecoration(
              label: "CVV",
              error: paymentDetails.cvvError,
              context: context,
            ),
            onChanged: context.read<OrderBloc>().onChangedPaymentDetailsCvv,
          ),
        )
    );
}