

import 'package:flutter/material.dart';
import 'package:lemon_pizza/order/ui/widgets/card_cvv.dart';
import 'package:lemon_pizza/order/ui/widgets/card_expiry_date_year.dart';
import 'package:lemon_pizza/order/ui/widgets/card_expiry_month.dart';
import 'package:lemon_pizza/order/ui/widgets/card_number.dart';

class PaymentDetailsView extends StatelessWidget {
  const PaymentDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        width: 300,
        height: 400,
        child: Column(
           children: [
              Text("CREDIT CARD NUMBER"),
              CardNumber(),
              Text("EXPIRES"),
              Row(
                children: [
                  ExpiryDateYear(),
                  CardExpiryMonth(),
                ],
              ),
              Text("CVS"),
              CardCvv(),
           ],
        ),
      ),
    );
  }
}