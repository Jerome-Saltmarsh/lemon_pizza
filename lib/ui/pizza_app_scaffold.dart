import 'package:flutter/material.dart';
import 'package:lemon_pizza/model/order_status.dart';
import 'package:lemon_pizza/ui/common/app_bar/app_bar_title.dart';
import 'package:lemon_pizza/ui/common/app_bar/order_back_button.dart';
import 'package:lemon_pizza/ui/common/app_bar/theme_hue_slider.dart';
import 'package:lemon_pizza/ui/common/toggles/theme_mode_toggle.dart';
import 'package:lemon_pizza/ui/views/order_create_view/create_order_view_mobile.dart';
import 'package:lemon_pizza/ui/views/order_create_view/create_order_view_desktop.dart';
import 'package:lemon_widgets/lemon_widgets.dart';

import 'desktop/widgets/order_status_changed.dart';
import 'views/order_customer_details_view.dart';
import 'views/order_payment_details_view.dart';
import 'views/order_payment_failed_view.dart';
import 'views/order_payment_in_progress_view.dart';
import 'views/order_payment_succeeded_view.dart';
import 'views/order_type_view.dart';


class PizzaAppScaffold extends StatelessWidget {
  const PizzaAppScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    return LayoutBuilder(
      builder: (context, size) {
        final isMobile = size.maxWidth < 700;

        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: colorScheme.surfaceVariant,
            title: const AppBarTitle(),
            leading: const OrderBackButton(),
            actions: [
              if (!isMobile)
              const SizedBox(
                width: 200,
                child: ThemeHueSlider(),
              ),
              Container(
                  margin: const EdgeInsets.only(right: 8),
                  child: const ThemeModeToggle()),
            ],
          ),
          body: OrderStatusChanged((context, orderStatus) {
            switch (orderStatus) {
              case OrderStatus.createOrder:
                return isMobile ? const CreateOrderViewMobile() : const CreateOrderViewDesktop();
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
          }),
        );
      }
    );
  }

}