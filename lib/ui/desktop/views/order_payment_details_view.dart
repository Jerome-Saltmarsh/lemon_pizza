

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lemon_pizza/blocs/order/order_state.dart';
import 'package:lemon_pizza/ui/common/animations/animate_position_down.dart';
import 'package:lemon_pizza/ui/common/extensions/build_context_extension.dart';
import 'package:lemon_pizza/ui/common/font_families.dart';
import 'package:lemon_pizza/ui/desktop/constants/numbers_only_formatter.dart';
import 'package:lemon_widgets/lemon_widgets.dart';

class PaymentDetailsView extends StatefulWidget {
  const PaymentDetailsView({super.key});

  @override
  State<PaymentDetailsView> createState() => _PaymentDetailsViewState();
}

class _PaymentDetailsViewState extends State<PaymentDetailsView> {

  final controllerCardNumber = TextEditingController();
  final controllerExpiryMonth = TextEditingController();
  final controllerExpiryYear = TextEditingController();
  final controllerCVV = TextEditingController();
  String? errorCardNumber;
  String? errorCVV;
  String? errorExpiryYear;
  String? errorExpiryMonth;

  TextStyle buildTextStyle(){
    return TextStyle(fontFamily: FontFamilies.roboto, color: context.colorScheme.secondary, fontSize:  context.fontSize.regular);
  }

  TextStyle buildLabelStyle(){
    return TextStyle(fontFamily: FontFamilies.roboto, color: context.colorScheme.secondary.withOpacity(0.5), fontSize:  context.fontSize.regular);
  }

  TextStyle buildTextStyleError(){
    return TextStyle(fontFamily: FontFamilies.roboto, color: context.colorScheme.error, fontSize:  context.fontSize.regular);
  }

  InputDecoration buildInputDecoration({required String text, String? error, Widget? prefixIcon, Color? prefixIconColor}){
    final color = context.colorScheme.secondary;
    return InputDecoration(
      prefixIcon: prefixIcon,
      prefixIconColor: prefixIconColor,
      counterText: '',
      label: buildLabel(text),
      labelStyle: buildLabelStyle(),
      focusColor: color,
      fillColor: color,
      errorStyle: buildTextStyleError(),
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

  Widget buildText(String value){
    return Text(value, style: buildTextStyle());
  }

  Widget buildLabel(String value){
    return Text(value, style: buildLabelStyle());
  }

  @override
  void dispose() {
    controllerExpiryYear.dispose();
    controllerExpiryMonth.dispose();
    controllerCardNumber.dispose();
    controllerCVV.dispose();
    super.dispose();
  }

  Widget buildTextFieldCardNumber() => TextField(
      cursorColor: context.colorScheme.secondary,
      controller: controllerCardNumber,
      style: buildTextStyle(),
      inputFormatters: [CreditCardNumberFormatter(), numbersAndSpaceFormatter],
      decoration: buildInputDecoration(
          text: "Card Number",
          error: errorCardNumber,
          prefixIcon: const Icon(Icons.credit_card),
          prefixIconColor: context.colorScheme.secondary.withOpacity(0.5),
        ),
    );

  Widget buildTextFieldExpiryMonth() => SizedBox(
      width: 70,
      child: TextField(
          maxLength: 2,
          cursorColor: context.colorScheme.secondary,
          maxLengthEnforcement: MaxLengthEnforcement.enforced,
          keyboardType: TextInputType.number,
          inputFormatters: [numbersOnlyFormatter],
          decoration: buildInputDecoration(text: "MM", error: errorExpiryMonth),
          controller: controllerExpiryMonth,
          ),
    );

  Widget buildTextFieldExpiryYear() => SizedBox(
      width: 120,
      child: TextField(
          maxLength: 4,
          cursorColor: context.colorScheme.secondary,
          maxLengthEnforcement: MaxLengthEnforcement.enforced,
          keyboardType: TextInputType.number,
          inputFormatters: [numbersOnlyFormatter],
          decoration: buildInputDecoration(text: "YYYY", error: errorExpiryYear),
          controller: controllerExpiryYear,
          ),
    );

  Widget buildTextFieldCVV() => SizedBox(
      width: 80,
      child: TextField(
          maxLength: 3,
          cursorColor: context.colorScheme.secondary,
          maxLengthEnforcement: MaxLengthEnforcement.enforced,
          keyboardType: TextInputType.number,
          inputFormatters: [numbersOnlyFormatter],
          decoration: buildInputDecoration(text: "CVV", error: errorCVV),
          controller: controllerCVV,
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
                          buildText("PAYMENT DETAILS"),
                          const SizedBox(height: 32),
                          buildTextFieldCardNumber(),
                         const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                              children: [
                                buildTextFieldExpiryMonth(),
                                const SizedBox(
                                  width: 4,
                                ),
                                buildTextFieldExpiryYear(),
                              ],),
                              buildTextFieldCVV(),
                            ],
                          ),
                       ],
                    ),
                  ),
                  TextButton(onPressed: () {
                    if (!validate()) {
                      return setState(() {

                      });
                    }

                    context.readOrderBloc.submitPaymentDetails(
                       PaymentDetails(
                          cardNumber: controllerCardNumber.text,
                          cvv: int.tryParse(controllerCVV.text),
                       )
                    );
                  },
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

  bool validate(){
    errorCardNumber = null;
    errorCVV = null;
    errorExpiryMonth = null;
    errorExpiryYear = null;

    if (controllerCardNumber.text.isEmpty){
      errorCardNumber = 'required';
    } else
    if (controllerCardNumber.text.length < 16){
      errorCardNumber = 'too short';
    }
    if (controllerCVV.text.length != 3){
      errorCVV = 'invalid';
    } else
    if (int.tryParse(controllerCVV.text) == null){
      errorCVV = 'invalid';
    }

    if (controllerExpiryYear.text.length != 4){
      errorExpiryYear = 'invalid';
    }

    if (controllerExpiryMonth.text.isEmpty){
      errorExpiryMonth = 'required';
    } else {
      final expiryMonth = int.tryParse(controllerExpiryMonth.text);
      if (expiryMonth == null || expiryMonth <= 0 || expiryMonth > 12){
       errorExpiryMonth = 'invalid';
      }
    }

    return errorCardNumber == null && errorCVV == null;
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