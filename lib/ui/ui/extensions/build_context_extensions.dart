
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lemon_pizza/blocs/order/order_bloc.dart';
import 'package:lemon_pizza/blocs/order/order_enums.dart';
import 'package:lemon_pizza/blocs/order/order_repository.dart';
import 'package:lemon_pizza/blocs/order/order_state.dart';
import 'package:lemon_pizza/blocs/theme/theme_bloc.dart';
import 'package:lemon_pizza/blocs/theme/theme_state.dart';

extension OrderContextExtensions on BuildContext {
    ThemeState get themeState => read<ThemeBloc>().state;
    OrderBloc get readOrderBloc => read<OrderBloc>();
    OrderState get readOrderState => readOrderBloc.state;
    OrderBloc get watchOrderBloc => watch<OrderBloc>();
    OrderState get watchOrderState => watchOrderBloc.state;
    OrderRepository get orderRepository => RepositoryProvider.of<OrderRepository>(this);

    void selectPizzaSize(PizzaSize size) =>
        emitOrderState(selectPizzaSize: size);

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
        PizzaType? selectPizzaType,
        PizzaSize? selectPizzaSize,
        bool? ordersPlacedVisible,
        OrderType? orderType,
    }) => readOrderBloc.emitOrderState(
          orderItems: orderItems,
          orderStatus: orderStatus,
          customerDetails: customerDetails,
          paymentDetails: paymentDetails,
          validate: validate,
          selectPizzaType: selectPizzaType,
          selectPizzaSize: selectPizzaSize,
          ordersPlacedVisible: ordersPlacedVisible,
          orderType: orderType,
        );
}