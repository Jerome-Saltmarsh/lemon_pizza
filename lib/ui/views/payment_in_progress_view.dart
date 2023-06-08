import 'package:flutter/material.dart';
import 'package:lemon_pizza/ui/common/font_families.dart';
import 'package:lemon_pizza/ui/extensions/build_context_extension.dart';
import 'package:lemon_widgets/lemon_widgets.dart';

class PaymentInProgressView extends StatelessWidget {
  const PaymentInProgressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
      "PAYMENT IN PROGRESS",
      style: TextStyle(
              color: context.colorScheme.secondary,
              fontFamily: FontFamilies.roboto, fontSize: context.fontSize.large),
    ),
            const SizedBox(width: 32),
            CircularProgressIndicator(color: context.colorScheme.primary,),
          ],
        ));
  }
}
