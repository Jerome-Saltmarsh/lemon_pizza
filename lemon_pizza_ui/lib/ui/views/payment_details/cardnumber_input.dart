
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lemon_pizza_ui/blocs/payment/payment_bloc.dart';

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
      decoration: InputDecoration(
        icon: const Icon(Icons.email),
        labelText: 'CardNumber',
        // helperText: 'A complete, valid email e.g. joe@gmail.com',
        errorText: paymentState.cardNumber.displayError?.name,
      ),
      keyboardType: TextInputType.emailAddress,
      onChanged: paymentBloc.onChangedCardNumber,
      textInputAction: TextInputAction.next,
    );
  }
}
