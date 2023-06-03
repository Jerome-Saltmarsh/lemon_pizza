

import 'package:flutter/material.dart';
import 'package:lemon_pizza/ui/common/font_families.dart';
import 'package:lemon_pizza/ui/desktop/widgets/card_cvv.dart';
import 'package:lemon_pizza/ui/desktop/widgets/card_expiry_date_year.dart';
import 'package:lemon_pizza/ui/desktop/widgets/card_expiry_month.dart';
import 'package:lemon_pizza/ui/desktop/widgets/card_holder_name.dart';
import 'package:lemon_pizza/ui/desktop/widgets/card_number.dart';
import 'package:lemon_widgets/lemon_widgets.dart';

class PaymentDetailsView extends StatelessWidget {
  const PaymentDetailsView({super.key});

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
            TextButton(onPressed: () {
              // context.readOrderBloc.submitPaymentDetails(
              //    PaymentDetails(
              //       // cardHolderName: contro
              //    )
              // );
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