

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lemon_pizza_ui/blocs/order/order_bloc.dart';
import 'package:lemon_pizza_ui/ui/extensions/build_context_extension.dart';
import 'package:lemon_pizza_ui/ui/font_families.dart';
import 'package:lemon_widgets/lemon_widgets.dart';

class SubmitOrderButton extends StatelessWidget {
  const SubmitOrderButton({super.key});

  @override
  Widget build(BuildContext context) => TextButton(
      onPressed: context.read<OrderBloc>().submitOrder,
      style: ButtonStyle(
        shape: context.readThemeState.buttonStyleShape,
        backgroundColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            return context.colorScheme.tertiary; // Default color
          },
        ),
      ),
      child: Container(
          width: 150,
          height: 50,
          alignment: Alignment.center,
          child: Text(
            "PAY ${context.readOrderBloc.formattedTotalCost}",
            style: TextStyle(
                fontFamily: FontFamilies.roboto,
                color: context.colorScheme.onTertiary),
          )));
}