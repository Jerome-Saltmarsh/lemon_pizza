

import 'package:flutter/cupertino.dart';
import 'package:lemon_pizza/model/order_status.dart';
import 'package:lemon_pizza/ui/desktop/widgets/order_status_changed.dart';

import 'order_create_view/create_order_view_desktop.dart';
import 'order_customer_details_view.dart';
import 'order_payment_details_view.dart';
import 'order_payment_failed_view.dart';
import 'order_payment_in_progress_view.dart';
import 'order_payment_succeeded_view.dart';
import 'order_type_view.dart';

class ScaffoldDesktopBody extends StatelessWidget {

  const ScaffoldDesktopBody({super.key});

  @override
  Widget build(BuildContext context) =>
      OrderStatusChanged((context, orderStatus) {
        switch (orderStatus) {
          case OrderStatus.createOrder:
            return const CreateOrderViewDesktop();
          case OrderStatus.orderType:
            return const OrderTypeView();
          case OrderStatus.customerDetails:
            return const CustomerDetailsView();
          case OrderStatus.paymentDetails:
            return const PaymentDetailsView();
          case OrderStatus.paymentInProgress:
            return const PaymentInProgressView();
          case OrderStatus.paymentSucceeded:
            return const PaymentSucceededView();
          case OrderStatus.paymentFailed:
            return const PaymentFailedView();
        }
      });
}