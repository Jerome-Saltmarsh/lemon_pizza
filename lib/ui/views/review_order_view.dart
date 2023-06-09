
import 'package:flutter/cupertino.dart';
import 'package:lemon_pizza/ui/extensions/build_context_extension.dart';
import 'package:lemon_pizza/ui/views/order_create_view/order_items_dialog/orders_column.dart';

class ReviewOrderView extends StatelessWidget {
  const ReviewOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: context.readThemeState.dialogPadding,
        child: const OrdersColumn(),
    );
  }

}