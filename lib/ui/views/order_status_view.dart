

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lemon_pizza/blocs/device/device_bloc.dart';
import 'package:lemon_pizza/model/order_status.dart';
import 'package:lemon_pizza/ui/views/order_create_view/create_order_view.dart';
import 'package:lemon_pizza/ui/widgets/order_status_changed.dart';
import 'customer_details_view.dart';
import 'order_create_view/create_order_view_desktop.dart';
import 'order_create_view/create_order_view_mobile.dart';
import 'payment_details_view.dart';
import 'payment_failed_view.dart';
import 'payment_in_progress_view.dart';
import 'payment_succeeded_view.dart';
import 'review_order_view.dart';
import 'type_type_view.dart';

class OrderStatusView extends StatelessWidget {
  const OrderStatusView({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = context.watch<DeviceBloc>().isMobile;

    return OrderStatusChanged((context, orderStatus) {

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

}