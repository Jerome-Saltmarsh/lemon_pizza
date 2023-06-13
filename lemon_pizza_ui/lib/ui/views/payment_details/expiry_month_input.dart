

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lemon_pizza_ui/blocs/order/order_bloc.dart';
import 'package:lemon_pizza_ui/ui/formatters/numbers_only_formatter.dart';
import 'package:lemon_pizza_ui/ui/views/payment_details/payment_details_builder.dart';
import 'package:lemon_widgets/lemon_widgets.dart';

import 'build_input_decoration.dart';

class ExpiryMonthInput extends StatelessWidget {
  const ExpiryMonthInput({super.key});

  @override
  Widget build(BuildContext context) => PaymentDetailsBuilder(
      builder: (context, paymentDetails) => SizedBox(
          width: 70,
          child: TextFormField(
            initialValue: paymentDetails.expiryMonth,
            maxLength: 2,
            cursorColor: context.colorScheme.secondary,
            maxLengthEnforcement: MaxLengthEnforcement.enforced,
            keyboardType: TextInputType.number,
            inputFormatters: [InputFormatters.numbersOnlyFormatter],
            decoration: buildInputDecoration(
              context: context,
              label: "MM",
              error: paymentDetails.expiryMonthError,
            ),
            onChanged: context.read<OrderBloc>().onChangedPaymentDetailsExpiryMonth,
          ),
        )
    );
}