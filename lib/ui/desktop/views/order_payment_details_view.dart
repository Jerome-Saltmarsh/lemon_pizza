

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lemon_pizza/blocs/order/order_state.dart';
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

  final controllerCardHolderName = TextEditingController();
  final controllerCardNumber = TextEditingController();
  final controllerCVV = TextEditingController();
  int? expiryYear;
  int? expiryMonth;
  String? controllerCardHolderNameError;
  String? controllerCardNumberError;
  String? controllerCVVError;

  TextStyle buildTextStyle(){
    return TextStyle(fontFamily: FontFamilies.roboto, color: context.colorScheme.onTertiary, fontSize:  context.fontSize.large);
  }

  TextStyle buildTextStyleError(){
    return TextStyle(fontFamily: FontFamilies.roboto, color: context.colorScheme.error, fontSize:  context.fontSize.large);
  }

  Widget buildText(String value){
    return Text(value, style: buildTextStyle());
  }

  Widget buildDropdownButtonExpiryYear()=> DropdownButton<int>(
      hint: buildText("Year"),
      value: expiryYear,
      items: List.generate(10, (index) => DateTime.now().year + index).map((year) => DropdownMenuItem(
        value: year,
        child: Text(year.toString()),
      )).toList(),
      onChanged: (expiryYear) {
        setState(() {
          this.expiryYear = expiryYear;
        });
      },
    );

  Widget buildDropdownButtonExpiryMonth()=> DropdownButton<int>(
      hint: buildText("Month"),
      value: expiryMonth,
      items: List.generate(12, (month) => DropdownMenuItem(
        value: month + 1,
        child: Text((month + 1).toString()),
      )
      ),
      onChanged: (month) {
          setState(() {
            expiryMonth = month;
          });
      },
    );

  Widget buildTextFieldCardholderName(){
    return TextField(
      controller: controllerCardHolderName,
      style: buildTextStyle(),
      decoration: InputDecoration(
          label: buildText("Card holder name"),
          errorStyle: buildTextStyleError(),
          errorText: controllerCardHolderNameError
      ),
    );
  }

  Widget buildTextFieldCardNumber(){
    return TextField(
      controller: controllerCardNumber,
      style: buildTextStyle(),
      inputFormatters: [CreditCardNumberFormatter(), numbersAndSpaceFormatter],
      decoration: InputDecoration(
          label: buildText("Card Number"),
          errorStyle: buildTextStyleError(),
          errorText: controllerCardNumberError,
      ),
    );
  }

  Widget buildTextFieldCVV(){
    return SizedBox(
      width: 50,
      child: TextField(
          maxLength: 3,
          maxLengthEnforcement: MaxLengthEnforcement.enforced,
          keyboardType: TextInputType.number,
          inputFormatters: [numbersOnlyFormatter],
          decoration: InputDecoration(
              counterText: '',
              label: buildText("CVV"),
              errorStyle: buildTextStyleError(),
              errorText: controllerCVVError,
          ),
          controller: controllerCVV,
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const width = 500.0;
    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: Center(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              width: width,
              height: width * 0.630434782608696,
              decoration: BoxDecoration(
                color: context.colorScheme.tertiary,
                borderRadius: const BorderRadius.all(Radius.circular(5)),
              ),
              child: Column(
                 children: [
                    Container(
                       width: double.infinity,
                       height: 40,
                      color: context.colorScheme.tertiaryContainer,
                    ),
                    buildTextFieldCardholderName(),
                    buildTextFieldCardNumber(),
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 20),
                          child: Row(
                            children: [
                              buildDropdownButtonExpiryYear(),
                              buildDropdownButtonExpiryMonth(),
                            ],
                          ),
                        ),
                        const SizedBox(width: 64),
                        buildTextFieldCVV(),
                      ],
                    ),
                 ],
              ),
            ),
            TextButton(onPressed: () {
              context.readOrderBloc.submitPaymentDetails(
                 PaymentDetails(
                    cardHolderName: controllerCardHolderName.text,
                    cardNumber: controllerCardNumber.text,
                    cvv: int.tryParse(controllerCVV.text),
                 )
              );
            },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                        (Set<MaterialState> states) {
                      return context.colorScheme.primary; // Default color
                    },
                  ),
                ),
                child: Text("SUBMIT ORDER", style: TextStyle(fontFamily: FontFamilies.roboto, color: context.colorScheme.onPrimary),))
          ],
        ),
      ),
    );
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