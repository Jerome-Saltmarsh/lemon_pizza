
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lemon_pizza/blocs/order/order_bloc.dart';
import 'package:lemon_pizza/ui/common/font_families.dart';
import 'package:lemon_widgets/lemon_widgets.dart';

import 'order_bloc_builder.dart';

class CardHolderName extends StatelessWidget {
  const CardHolderName({super.key});

  @override
  Widget build(BuildContext context) {

    final controller = TextEditingController(
        text: context.read<OrderBloc>().state.paymentDetails.cardHolderName
    );

    return OrderBlocBuilder(
        buildWhen: (previous, current) =>
        previous.paymentDetails.cardHolderName != current.paymentDetails.cardHolderName ||
            previous.validate != current.validate,
        builder: (context, orderState){
          return TextField(
            controller: controller,
            onChanged: (value){
              context
                  .read<OrderBloc>()
                  .emitPaymentDetails(cardHolderName: value);
            },
            style: const TextStyle(fontFamily: FontFamilies.roboto),
            decoration: InputDecoration(
                label: Text("Card holder name", style: TextStyle(fontFamily: FontFamilies.roboto, color: context.colorScheme.onTertiary),),
                errorStyle: TextStyle(fontFamily: FontFamilies.roboto, color: context.colorScheme.error),
                errorText:
                orderState.validate &&
                    !orderState.paymentDetails.cardHolderNameValid
                    ? 'required' : null
            ),
          );
        });
  }
}