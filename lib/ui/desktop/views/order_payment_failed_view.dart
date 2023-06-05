
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lemon_pizza/blocs/order/order_bloc.dart';
import 'package:lemon_pizza/ui/common/extensions/build_context_extension.dart';
import 'package:lemon_pizza/ui/common/font_families.dart';
import 'package:lemon_widgets/lemon_widgets.dart';

class PaymentFailedView extends StatelessWidget {
  const PaymentFailedView({super.key});

  @override
  Widget build(BuildContext context) => Center(
    child: Column(
        children: [
          const SizedBox(height: 16),
          Text("PAYMENT FAILED",
            style: TextStyle(
                color: context.colorScheme.secondary,
                fontFamily: FontFamilies.roboto,
                fontSize: context.fontSize.large,
            ),
          ),
          TextButton(
            onPressed: context.read<OrderBloc>().next,
            child: Text("TRY AGAIN", style: TextStyle(
              color: context.colorScheme.secondary,
              fontFamily: FontFamilies.roboto,
              fontSize: context.fontSize.large,
            ),),
          ),
        ],
      ),
  );
}