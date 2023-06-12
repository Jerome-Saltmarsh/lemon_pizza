
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lemon_pizza_domain/lemon_pizza_domain.dart';
import 'package:lemon_pizza_ui/blocs/order/order_bloc.dart';
import 'package:lemon_pizza_ui/ui/font_families.dart';
import 'package:lemon_widgets/lemon_widgets.dart';

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
              focusColor: context.colorScheme.onSurface,
              icon: const Icon(Icons.credit_card),
              labelText: 'CardNumber',
              labelStyle: const TextStyle(fontFamily: FontFamilies.roboto),
              errorText: paymentDetails.cardNumberError,
              errorStyle: const TextStyle(fontFamily: FontFamilies.roboto)
            ),
            keyboardType: TextInputType.number,
            onChanged: context.read<OrderBloc>().onChangedCardNumber,
            textInputAction: TextInputAction.next,
          );
        });
}


