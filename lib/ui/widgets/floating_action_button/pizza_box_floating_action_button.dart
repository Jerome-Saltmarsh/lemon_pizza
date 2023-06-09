import 'package:flutter/material.dart';
import 'package:lemon_pizza/model/order_status.dart';
import 'package:lemon_pizza/ui/widgets/floating_action_button/review_orders_button.dart';
import 'package:lemon_pizza/ui/widgets/order_status_changed.dart';

class PizzaBoxFloatingActionButton extends StatelessWidget {
  const PizzaBoxFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) =>
      OrderStatusChanged((context, orderStatus) => switch (orderStatus) {
            OrderStatus.createOrder => const ReviewOrdersButton(),
            // OrderStatus.reviewOrder => const CheckoutButton(),
            _ => const SizedBox()
          });
}
