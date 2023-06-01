

import 'package:flutter/material.dart';
import 'package:lemon_pizza/ui/ui/widgets/card_cvv.dart';
import 'package:lemon_pizza/ui/ui/widgets/card_expiry_date_year.dart';
import 'package:lemon_pizza/ui/ui/widgets/card_expiry_month.dart';
import 'package:lemon_pizza/ui/ui/widgets/card_holder_name.dart';
import 'package:lemon_pizza/ui/ui/widgets/card_number.dart';

class PaymentDetailsView extends StatelessWidget {
  const PaymentDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    const width = 500.0;
    return Center(
      child: Container(
        padding: const EdgeInsets.all(16),
        width: width,
        height: width * 0.630434782608696,
        decoration: const BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        child: Column(
           children: [
              Container(
                 width: double.infinity,
                 height: 40,
                 color: Colors.black54,
              ),
              const CardHolderName(),
              const CardNumber(),
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: const Row(
                      children: [
                        ExpiryDateYear(),
                        CardExpiryMonth(),
                      ],
                    ),
                  ),
                  const SizedBox(width: 64),
                  const CardCvv(),
                ],
              ),
           ],
        ),
      ),
    );
  }
}