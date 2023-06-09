
import 'package:flutter/material.dart';
import 'package:lemon_pizza/ui/extensions/build_context_extension.dart';
import 'package:lemon_pizza/ui/views/order_create_view/order_items_dialog/orders_column.dart';
import 'package:lemon_widgets/lemon_widgets.dart';


class OrderItemsDialog extends StatelessWidget {

  const OrderItemsDialog({super.key});

  @override
  Widget build(BuildContext context) => FadeIn(
      child: Container(
        width: 200,
        padding: const EdgeInsets.all(16),
        constraints: const BoxConstraints(maxHeight: 400),
        decoration: BoxDecoration(
          color: context.colorScheme.surfaceVariant,
          borderRadius: context.readThemeState.dialogBorderRadius,
        ),
        child: const OrdersColumn(),
      ),
    );

}