
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lemon_pizza_domain/lemon_pizza_domain.dart';
import 'package:lemon_pizza_ui/blocs/order/order_bloc.dart';
import 'package:lemon_pizza_ui/ui/font_families.dart';

import 'cardnumber_formatter.dart';

class CardNumberInput extends StatelessWidget {
  const CardNumberInput({super.key, required this.focusNode});

  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) => BlocBuilder<OrderBloc, Order>(
        buildWhen: (previous, current) => previous.paymentDetails != current.paymentDetails,
        builder: (context, order){
          final paymentDetails = order.paymentDetails;
          return TextFormField(
            initialValue: paymentDetails.cardNumber,
            focusNode: focusNode,
            inputFormatters: [CardNumberFormatter()],
            decoration: InputDecoration(
              icon: const Icon(Icons.credit_card),
              labelText: 'CardNumber',
              labelStyle: const TextStyle(fontFamily: FontFamilies.roboto),
              errorText: paymentDetails.cardNumberError,
            ),
            keyboardType: TextInputType.emailAddress,
            // onChanged: paymentBloc.onChangedCardNumber,
            textInputAction: TextInputAction.next,
          );
        });
}


