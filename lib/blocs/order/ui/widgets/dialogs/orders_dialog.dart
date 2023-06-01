
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lemon_pizza/blocs/order/ui/extensions/build_context_extensions.dart';
import 'package:lemon_pizza/blocs/order/ui/widgets/buttons/checkout_button.dart';
import 'package:lemon_pizza/blocs/order/ui/widgets/orders_column_item.dart';
import 'package:lemon_pizza/blocs/theme/bloc/theme_bloc.dart';
import 'package:lemon_pizza/style.dart';
import 'package:lemon_widgets/lemon_widgets.dart';

class OrdersDialog extends StatelessWidget {

  const OrdersDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final orderState = context.watchOrderState;
    final orderItems = orderState.orderItems;
    final colorScheme = context.colorScheme;
    final fontSize = context.read<ThemeBloc>().state.fontSize;

    return FadeIn(
      child: Container(
        width: 200,
        padding: const EdgeInsets.all(16),
        constraints: const BoxConstraints(maxHeight: 400),
        decoration: BoxDecoration(
          color: colorScheme.surfaceVariant,
          borderRadius: Style.dialogBorderRadius,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("ORDERS PLACED", style: TextStyle(color: colorScheme.secondary, fontSize: fontSize.large),),
            Expanded(
              child: Container(
                constraints: const BoxConstraints(maxHeight: 300),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: orderItems.map(
                                (orderItem) => OrdersColumnItem(orderItem: orderItem)
                        ).toList(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const CheckoutButton(),
          ],
        ),
      ),
    );
  }

}