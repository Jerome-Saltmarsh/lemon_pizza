
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lemon_pizza_ui/blocs/payment/payment_bloc.dart';
import 'package:lemon_pizza_ui/ui/font_families.dart';

import 'cardnumber_formatter.dart';

class CardNumberInput extends StatelessWidget {
  const CardNumberInput({super.key, required this.focusNode});

  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {

    final paymentBloc = context.read<PaymentBloc>();
    final paymentState = paymentBloc.state;

    return TextFormField(
      initialValue: paymentBloc.state.cardNumber.value,
      focusNode: focusNode,
      inputFormatters: [CardNumberFormatter()],
      decoration: InputDecoration(
        icon: const Icon(Icons.credit_card),
        labelText: 'CardNumber',
        labelStyle: const TextStyle(fontFamily: FontFamilies.roboto),
        errorText: paymentState.cardNumber.displayError?.name,
      ),
      keyboardType: TextInputType.emailAddress,
      onChanged: paymentBloc.onChangedCardNumber,
      textInputAction: TextInputAction.next,
    );
  }
}


