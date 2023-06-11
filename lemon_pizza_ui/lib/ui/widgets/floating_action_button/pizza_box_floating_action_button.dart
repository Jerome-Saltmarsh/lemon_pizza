import 'package:flutter/material.dart';
import 'package:lemon_pizza_domain/lemon_pizza_domain.dart';
import 'package:lemon_pizza_ui/ui/widgets/order_status_changed.dart';

import 'review_orders_button.dart';

class PizzaBoxFloatingActionButton extends StatelessWidget {
  const PizzaBoxFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) =>
      OrderStatusChanged((context, orderStatus) => switch (orderStatus) {
            OrderStatus.createOrder => const ReviewOrdersButton(),
            _ => const SizedBox()
          });
}
