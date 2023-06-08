import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lemon_pizza/blocs/layout/layout_bloc.dart';
import 'package:lemon_pizza/blocs/layout/layout_type.dart';
import 'package:lemon_pizza/blocs/order/order_bloc.dart';
import 'package:lemon_pizza/blocs/select/select_bloc.dart';
import 'package:lemon_pizza/ui/common/font_families.dart';
import 'package:lemon_pizza/ui/extensions/build_context_extension.dart';
import 'package:lemon_pizza/ui/views/order_create_view/pizza_size_dialog/pizza_size_dialog_column.dart';
import 'package:lemon_pizza/ui/views/order_create_view/pizza_size_dialog/pizza_size_dialog_row.dart';
import 'package:lemon_widgets/lemon_widgets.dart';

class PizzaSizeDialog extends StatelessWidget {
  const PizzaSizeDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final selectBloc = context.watch<SelectBloc>();
    final selectState = selectBloc.state;
    final colorScheme = context.colorScheme;
    final themeState = context.readThemeState;
    final layoutType = context.watch<LayoutBloc>().state;
    const blur = 4.0;

    final selectPizzaType = selectState.pizzaType;

    if (selectPizzaType == null) {
      return const SizedBox();
    }

    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
      child: Stack(
        alignment: Alignment.center,
        children: [
          AnimatePosition(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeOut,
            side: Side.top,
            start: 0,
            end: 100,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: context.colorScheme.surfaceVariant,
                borderRadius: themeState.dialogBorderRadius,
              ),
              padding: themeState.dialogPadding,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const SizedBox(height: 16),
                  if (layoutType == LayoutType.desktop)
                    const PizzaSizeDialogRow(),
                  if (layoutType == LayoutType.mobile)
                    const PizzaSizeDialogColumn(),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed: selectBloc.clearPizzaType,
                          child: Text(
                            "Cancel",
                            style: TextStyle(
                                fontFamily: FontFamilies.secondary,
                                color: colorScheme.secondary),
                          )),
                      TextButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.resolveWith<Color?>(
                              (Set<MaterialState> states) {
                                if (states.contains(MaterialState.disabled)) {
                                  return Colors
                                      .grey; // Color when the button is disabled
                                }
                                if (states.contains(MaterialState.hovered)) {
                                  return colorScheme.inversePrimary;
                                }
                                return colorScheme.primary; // Default color
                              },
                            ),
                          ),
                          onPressed: () {
                            context.read<OrderBloc>().addPizza(
                                pizzaType: selectPizzaType,
                                pizzaSize: selectState.pizzaSize);
                            context.read<SelectBloc>().clearPizzaType();
                          },
                          child: Text(
                            "CONFIRM",
                            style: TextStyle(
                                fontFamily: FontFamilies.secondary,
                                color: colorScheme.onPrimary),
                          )),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
