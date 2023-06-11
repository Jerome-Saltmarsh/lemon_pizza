
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lemon_pizza/blocs/order/order_bloc.dart';
import 'package:lemon_pizza/ui/font_families.dart';
import 'package:lemon_pizza/ui/extensions/build_context_extension.dart';
import 'package:lemon_pizza_model/lemon_pizza_model.dart';
import 'package:lemon_widgets/lemon_widgets.dart';

class PaymentFailedView extends StatelessWidget {
  const PaymentFailedView({super.key});

  @override
  Widget build(BuildContext context) => Center(
    child: Container(
      width: 400,
      padding: context.readThemeState.dialogPadding,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("PAYMENT FAILED",
              style: TextStyle(
                  color: context.colorScheme.secondary,
                  fontFamily: FontFamilies.roboto,
                  fontSize: context.fontSize.large,
              ),
            ),
            const SizedBox(height: 32),
            TextButton(
              onPressed: () => context.read<OrderBloc>().emitOrderState(orderStatus: OrderStatus.paymentDetails),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                      (Set<MaterialState> states) {
                    return context.colorScheme.error; // Default color
                  },
                ),
              ),
              child: Text("TRY AGAIN", style: TextStyle(
                color: context.colorScheme.onError,
                fontFamily: FontFamilies.roboto,
                fontSize: context.fontSize.large,
              ),),
            ),
          ],
        ),
    ),
  );
}