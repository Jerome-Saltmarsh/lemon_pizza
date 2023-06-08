
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lemon_pizza/blocs/order/order_bloc.dart';
import 'package:lemon_pizza/ui/common/font_families.dart';
import 'package:lemon_pizza/ui/extensions/build_context_extension.dart';
import 'package:lemon_widgets/lemon_widgets.dart';

class PaymentSucceededView extends StatelessWidget {
  const PaymentSucceededView({super.key});

  @override
  Widget build(BuildContext context) {

    final paymentSucceededText = Text("PAYMENT SUCCEEDED",
      style: TextStyle(
        fontSize: context.fontSize.regular,
        color: context.colorScheme.secondary,
        fontFamily: FontFamilies.roboto,
      ),
    );

    final restartButton = TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
              return context.colorScheme.primaryContainer; // Default color
            },
          ),
        ),
        onPressed: context.read<OrderBloc>().restart,
        child: Text("RESTART",
            style: TextStyle(
              fontSize: context.fontSize.regular,
              color: context.colorScheme.onPrimaryContainer,
              fontFamily: FontFamilies.roboto,
            ))
    );

    final tickIcon = Icon(Icons.done, color: context.colorScheme.secondary, size: 40,);

    return Center(
      child: Container(
        alignment: Alignment.center,
        width: 300,
        height: 100,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                paymentSucceededText,
                const SizedBox(width: 16),
                tickIcon,
              ],
            ),
            const SizedBox(height: 16),
            restartButton
          ],
        ),
      ),
    );
  }
}