
import 'package:flutter/cupertino.dart';
import 'package:lemon_pizza/ui/extensions/build_context_extension.dart';
import 'package:lemon_pizza/ui/font_families.dart';
import 'package:lemon_pizza/ui/widgets/buttons/checkout_button.dart';
import 'package:lemon_widgets/lemon_widgets.dart';

import 'order_create_view/order_items/order_items_column/order_items_column.dart';

class ReviewOrderView extends StatelessWidget {
  const ReviewOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: context.readThemeState.dialogPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text("ORDERS PLACED", style: TextStyle(
                fontFamily: FontFamilies.secondary,
                color: context.colorScheme.secondary, fontSize: context.fontSize.large),),
            SizedBox(
                height: MediaQuery.of(context).size.height - 200,
                child: const SingleChildScrollView(child: OrderItemsColumn())),
            const SizedBox(
                width: 200,
                child: CheckoutButton(borderRadius: BorderRadius.all(Radius.circular(4)),)),
          ],
        ),
    );
  }

}