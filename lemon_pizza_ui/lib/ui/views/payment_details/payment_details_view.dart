

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lemon_pizza_ui/blocs/order/order_bloc.dart';
import 'package:lemon_pizza_ui/ui/extensions/build_context_extension.dart';
import 'package:lemon_pizza_ui/ui/font_families.dart';
import 'package:lemon_pizza_ui/ui/formatters/numbers_only_formatter.dart';
import 'package:lemon_pizza_ui/ui/views/payment_details/expiry_month_input.dart';
import 'package:lemon_pizza_ui/ui/views/payment_details/submit_order_button.dart';
import 'package:lemon_pizza_ui/ui/widgets/animations/animate_position_down.dart';
import 'package:lemon_widgets/lemon_widgets.dart';

import 'build_input_decoration.dart';
import 'cardnumber_input.dart';

class PaymentDetailsView extends StatelessWidget {
  final focusNodeCardNumber = FocusNode();

  PaymentDetailsView({super.key});

  TextStyle buildTextStyle(BuildContext context){
    return TextStyle(fontFamily: FontFamilies.roboto, color: context.colorScheme.secondary, fontSize:  context.fontSize.regular);
  }

  TextStyle buildLabelStyle(BuildContext context){
    return TextStyle(fontFamily: FontFamilies.roboto, color: context.colorScheme.secondary.withOpacity(0.5), fontSize:  context.fontSize.regular);
  }

  TextStyle buildTextStyleError(BuildContext context){
    return TextStyle(fontFamily: FontFamilies.roboto, color: context.colorScheme.error, fontSize:  context.fontSize.regular);
  }


  Widget buildText(String value, BuildContext context){
    return Text(value, style: buildTextStyle(context));
  }

  Widget buildLabel(String value, BuildContext context){
    return Text(value, style: buildLabelStyle(context));
  }

  Widget buildTextFieldExpiryYear(BuildContext context) => SizedBox(
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

  Widget buildTextFieldCVV(BuildContext context) => SizedBox(
      width: 80,
      child: TextField(
          maxLength: 3,
          cursorColor: context.colorScheme.secondary,
          maxLengthEnforcement: MaxLengthEnforcement.enforced,
          keyboardType: TextInputType.number,
          inputFormatters: [InputFormatters.numbersOnlyFormatter],
          decoration: buildInputDecoration(
              label: "CVV",
              error: context.read<OrderBloc>().state.paymentDetails.cvvError,
              context: context,
          ),
          controller: TextEditingController(
            text: context.read<OrderBloc>().state.paymentDetails.cvv
          ),
          onChanged: (value){
            final orderBloc = context.read<OrderBloc>();
            orderBloc.emitOrderState(
                paymentDetails: orderBloc.state.paymentDetails.copyWith(cvv: value)
            );
          },
          ),
    );

  @override
  Widget build(BuildContext context) {
    const width = 400.0;

    return Stack(
      alignment: Alignment.center,
      children: [
        AnimatePositionDown(
          child: Container(
            margin: const EdgeInsets.only(top: 16),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    width: width,
                    child: Column(
                       children: [
                          buildText("PAYMENT DETAILS", context),
                          const SizedBox(height: 32),
                          CardNumberInput(focusNode: focusNodeCardNumber,),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                              children: [
                                const ExpiryMonthInput(),
                                const SizedBox(width: 4),
                                buildTextFieldExpiryYear(context),
                              ],),
                              buildTextFieldCVV(context),
                            ],
                          ),
                       ],
                    ),
                  ),
                  SubmitOrderButton(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

