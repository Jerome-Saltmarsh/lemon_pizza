

import 'package:flutter/material.dart';
import 'package:lemon_pizza_ui/ui/views/payment_details/cvv_input.dart';
import 'package:lemon_pizza_ui/ui/views/payment_details/expiry_month_input.dart';
import 'package:lemon_pizza_ui/ui/views/payment_details/expiry_year_input.dart';
import 'package:lemon_pizza_ui/ui/views/payment_details/submit_order_button.dart';
import 'package:lemon_pizza_ui/ui/widgets/animations/animate_position_down.dart';

import 'cardnumber_input.dart';

class PaymentDetailsView extends StatelessWidget {
  final focusNodeCardNumber = FocusNode();

  PaymentDetailsView({super.key});

  @override
  Widget build(BuildContext context) => Stack(
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
                    width: 400,
                    child: Column(
                       children: [
                          const Text("PAYMENT DETAILS"),
                          const SizedBox(height: 32),
                          CardNumberInput(focusNode: focusNodeCardNumber,),
                          const SizedBox(height: 16),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                              children: [
                                ExpiryMonthInput(),
                                SizedBox(width: 4),
                                ExpiryYearInput(),
                              ],),
                              CvvInput(),
                            ],
                          ),
                       ],
                    ),
                  ),
                  const SubmitOrderButton(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
}

