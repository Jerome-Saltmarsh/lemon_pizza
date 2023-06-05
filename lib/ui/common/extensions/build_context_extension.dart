
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lemon_pizza/blocs/order/order_bloc.dart';
import 'package:lemon_pizza/blocs/order/order_enums.dart';
import 'package:lemon_pizza/blocs/order/order_repository.dart';
import 'package:lemon_pizza/blocs/order/order_state.dart';
import 'package:lemon_pizza/blocs/theme/theme_bloc.dart';
import 'package:lemon_pizza/blocs/theme/theme_state.dart';

extension BuildContextExtension on BuildContext {
   FontSize get fontSize => readThemeState.fontSize;
   ThemeState get readThemeState => read<ThemeBloc>().state;
   OrderBloc get readOrderBloc => read<OrderBloc>();
   OrderState get readOrderState => readOrderBloc.state;
   OrderBloc get watchOrderBloc => watch<OrderBloc>();
   OrderState get watchOrderState => watchOrderBloc.state;
   OrderRepository get orderRepository => RepositoryProvider.of<OrderRepository>(this);

   void selectOrderStatusOrderType() {
      emitOrderState(orderStatus: OrderStatus.customerDetails);
   }

   void selectOrderTypePickup() =>
       emitOrderState(orderType: OrderType.pickup, orderStatus: OrderStatus.customerDetails);

   void selectOrderTypeDeliver() =>
       emitOrderState(orderType: OrderType.deliver, orderStatus: OrderStatus.customerDetails);

   void emitOrderState({
      List<OrderItem>? orderItems,
      OrderStatus? orderStatus,
      CustomerDetails? customerDetails,
      PaymentDetails? paymentDetails,
      bool? validate,
      OrderType? orderType,
   }) => readOrderBloc.emitOrderState(
      orderItems: orderItems,
      orderStatus: orderStatus,
      customerDetails: customerDetails,
      paymentDetails: paymentDetails,
      validate: validate,
      orderType: orderType,
   );

}
