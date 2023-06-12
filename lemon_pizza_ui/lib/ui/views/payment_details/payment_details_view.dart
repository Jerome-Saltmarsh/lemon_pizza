

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lemon_pizza_ui/blocs/order/order_bloc.dart';
import 'package:lemon_pizza_ui/ui/extensions/build_context_extension.dart';
import 'package:lemon_pizza_ui/ui/font_families.dart';
import 'package:lemon_pizza_ui/ui/formatters/numbers_only_formatter.dart';
import 'package:lemon_pizza_ui/ui/widgets/animations/animate_position_down.dart';
import 'package:lemon_widgets/lemon_widgets.dart';

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

  InputDecoration buildInputDecoration({
    required BuildContext context,
    required String text, String? error, Widget? prefixIcon, Color? prefixIconColor}){
    final color = context.colorScheme.secondary;
    return InputDecoration(
      prefixIcon: prefixIcon,
      prefixIconColor: prefixIconColor,
      counterText: '',
      label: buildLabel(text, context),
      labelStyle: buildLabelStyle(context),
      focusColor: color,
      fillColor: color,
      errorStyle: buildTextStyleError(context),
      errorText: error,
      border: OutlineInputBorder(
        borderSide: BorderSide(color: color),
        borderRadius: context.readThemeState.dialogBorderRadius,
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: color),
        borderRadius: context.readThemeState.dialogBorderRadius,
      ),
    );
  }

  Widget buildText(String value, BuildContext context){
    return Text(value, style: buildTextStyle(context));
  }

  Widget buildLabel(String value, BuildContext context){
    return Text(value, style: buildLabelStyle(context));
  }

  Widget buildTextFieldExpiryMonth(BuildContext context) => SizedBox(
      width: 70,
      child: TextField(
          maxLength: 2,
          cursorColor: context.colorScheme.secondary,
          maxLengthEnforcement: MaxLengthEnforcement.enforced,
          keyboardType: TextInputType.number,
          inputFormatters: [numbersOnlyFormatter],
          decoration: buildInputDecoration(
              context: context,
              text: "MM",
              error: context.read<OrderBloc>().state.paymentDetails.expiryMonthError,
          ),
          onChanged: (value){
            final orderBloc = context.read<OrderBloc>();
            orderBloc.emitOrderState(
               paymentDetails: orderBloc.state.paymentDetails.copyWith(expiryMonth: value)
            );
          },
          controller: TextEditingController(text: context.read<OrderBloc>().state.paymentDetails.expiryMonth),
          ),
    );

  Widget buildTextFieldExpiryYear(BuildContext context) => SizedBox(
      width: 120,
      child: TextField(
          maxLength: 4,
          cursorColor: context.colorScheme.secondary,
          maxLengthEnforcement: MaxLengthEnforcement.enforced,
          keyboardType: TextInputType.number,
          inputFormatters: [numbersOnlyFormatter],
          decoration: buildInputDecoration(
              text: "YYYY",
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
          inputFormatters: [numbersOnlyFormatter],
          decoration: buildInputDecoration(
              text: "CVV",
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
                                buildTextFieldExpiryMonth(context),
                                const SizedBox(width: 4),
                                buildTextFieldExpiryYear(context),
                              ],),
                              buildTextFieldCVV(context),
                            ],
                          ),
                       ],
                    ),
                  ),
                  TextButton(onPressed: context.read<OrderBloc>().submitOrder,
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: context.readThemeState.dialogBorderRadius, // Set the border radius here
                          ),
                        ),
                        backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                              (Set<MaterialState> states) {
                            return context.colorScheme.tertiary; // Default color
                          },
                        ),
                      ),
                      child: Container(
                          width: 150,
                          height: 50,
                          alignment: Alignment.center,
                          child: Text("PAY ${context.readOrderBloc.formattedTotalCost}",
                            style: TextStyle(fontFamily: FontFamilies.roboto, color: context.colorScheme.onTertiary),)))
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

