

import 'package:flutter/cupertino.dart';
import 'package:lemon_pizza_domain/lemon_pizza_domain.dart';
import 'package:lemon_pizza_ui/ui/views/payment_error_view.dart';
import 'package:lemon_pizza_ui/ui/widgets/order_status_changed.dart';
import 'customer_details_view.dart';
import 'order_create_view/create_order_view.dart';
import 'payment_details/payment_details_view.dart';
import 'payment_failed_view.dart';
import 'payment_in_progress_view.dart';
import 'payment_succeeded_view.dart';
import 'review_order_view.dart';
import 'order_type_view.dart';

class OrderStatusView extends StatelessWidget {
  const OrderStatusView({super.key});

  @override
  Widget build(BuildContext context) => OrderStatusChanged((context, orderStatus) {
      switch (orderStatus) {
        case OrderStatus.createOrder:
          return const CreateOrderView();
        case OrderStatus.reviewOrder:
          return const ReviewOrderView();
        case OrderStatus.orderType:
          return const OrderTypeView();
        case OrderStatus.customerDetails:
          return const CustomerDetailsView();
        case OrderStatus.paymentDetails:
          return PaymentDetailsView();
        case OrderStatus.paymentInProgress:
          return const PaymentInProgressView();
        case OrderStatus.paymentSucceeded:
          return const PaymentSucceededView();
        case OrderStatus.paymentFailed:
          return const PaymentFailedView();
        case OrderStatus.paymentError:
          return const PaymentErrorView();
      }
    });

}