
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lemon_pizza_ui/blocs/order/order_bloc.dart';
import 'package:lemon_pizza_ui/ui/formatters/numbers_only_formatter.dart';
import 'package:lemon_widgets/lemon_widgets.dart';

import 'build_input_decoration.dart';

class ExpiryYearInput extends StatelessWidget {
  const ExpiryYearInput({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      child: TextField(
        maxLength: 4,
        cursorColor: context.colorScheme.secondary,
        maxLengthEnforcement: MaxLengthEnforcement.enforced,
        keyboardType: TextInputType.number,
        inputFormatters: [InputFormatters.numbersOnlyFormatter],
        decoration: buildInputDecoration(
          label: "YYYY",
          error: context.read<OrderBloc>().state.paymentDetails.expiryYearError,
          context: context,
        ),
        controller: TextEditingController(text: context.read<OrderBloc>().state.paymentDetails.expiryYear),
        onChanged: (value){
          final orderBloc = context.read<OrderBloc>();
          orderBloc.emitOrderState(
              paymentDetails: orderBloc.state.paymentDetails.copyWith(expiryYear: value)
          );
        },
      ),
    );
  }
}
