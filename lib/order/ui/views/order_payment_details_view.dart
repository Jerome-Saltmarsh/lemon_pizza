

import 'package:flutter/material.dart';

class PaymentDetailsView extends StatelessWidget {
  const PaymentDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
       children: [
          const Text("CREDIT CARD NUMBER"),
          const Text("EXPIRES"),
          const Text("CVS"),
          TextButton(onPressed: (){}, child: const Text("CONFIRM PAYMENT")),
       ],
    );
  }
}