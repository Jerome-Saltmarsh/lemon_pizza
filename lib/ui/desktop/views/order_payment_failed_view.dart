
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_ratio/constants.dart';
import 'package:lemon_pizza/blocs/order/order_bloc.dart';
import 'package:lemon_pizza/ui/common/extensions/build_context_extension.dart';
import 'package:lemon_pizza/ui/common/font_families.dart';
import 'package:lemon_widgets/lemon_widgets.dart';

class PaymentFailedView extends StatelessWidget {
  const PaymentFailedView({super.key});

  @override
  Widget build(BuildContext context) => Center(
    child: Container(
      width: 400,
      padding: context.readThemeState.dialogPadding,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("PAYMENT FAILED",
              style: TextStyle(
                  color: context.colorScheme.secondary,
                  fontFamily: FontFamilies.roboto,
                  fontSize: context.fontSize.large,
              ),
            ),
            const SizedBox(width: 32),
            TextButton(
              onPressed: context.read<OrderBloc>().next,
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