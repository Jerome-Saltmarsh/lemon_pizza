
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lemon_pizza/blocs/order/order_bloc.dart';
import 'package:lemon_pizza/ui/ui/constants/numbers_only_formatter.dart';

import 'order_bloc_builder.dart';

class CardNumber extends StatelessWidget {
  const CardNumber({super.key});

  @override
  Widget build(BuildContext context) {

    final controller = TextEditingController(
        text: context.read<OrderBloc>().state.paymentDetails.cardNumber
    );

    return OrderBlocBuilder(
        buildWhen: (previous, current) =>
            previous.paymentDetails.cardNumber != current.paymentDetails.cardNumber ||
            previous.validate != current.validate,
        builder: (context, orderState) {
         return TextField(
             controller: controller,
             onChanged: (value) {
               context
                   .read<OrderBloc>()
                   .emitPaymentDetails(cardNumber: value);
             },
             inputFormatters: [CreditCardNumberFormatter(), numbersAndSpaceFormatter],
             decoration: InputDecoration(
                label: const Text("Card Number"),
                errorText:
                    orderState.validate
                        ? orderState.paymentDetails.cardNumberInvalidReason
                        : null
             ),
         );
    });
  }
}

class CreditCardNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final originalText = newValue.text.replaceAll(" ", "");
    var text = "";
    for (var i = 0; i < originalText.length; i++) {
      if (i > 0 && i % 4 == 0) {
        text += " ";
      }
      text += originalText.characters.elementAt(i);
    }
    var offset = oldValue.selection.end + 1;

    if (oldValue.selection.end == 04 ||
        oldValue.selection.end == 09 ||
        oldValue.selection.end == 14 ||
        oldValue.selection.end == 19) {
      offset++;
    }
    return TextEditingValue(
      text: text,
      selection: TextSelection.collapsed(offset: offset),
    );
  }
}