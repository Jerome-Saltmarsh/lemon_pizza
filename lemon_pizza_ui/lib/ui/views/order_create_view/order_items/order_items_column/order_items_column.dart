import 'package:flutter/cupertino.dart';
import 'package:lemon_pizza/ui/extensions/build_context_extension.dart';

import 'order_items_column_item.dart';

class OrderItemsColumn extends StatelessWidget {
  const OrderItemsColumn({super.key});

  @override
  Widget build(BuildContext context) => Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children:  context.watchOrderState.orderItems
          .map((orderItem) => OrderItemsColumnItem(orderItem: orderItem))
          .toList(),
    );
}
