
import 'package:lemon_pizza/model/order_status.dart';
import 'package:lemon_pizza/model/order_type.dart';
import 'package:lemon_pizza/model/pizza_size.dart';
import 'package:lemon_pizza/model/pizza_type.dart';


class OrderItem {
   final PizzaType pizzaType;
   final PizzaSize pizzaSize;
   final int quantity;
   final double pricePerPizza;

   OrderItem({
     required this.pizzaType,
     required this.pizzaSize,
     required this.quantity,
     required this.pricePerPizza,
   });

   double get totalCost => pricePerPizza * quantity;
}

class OrderState {
  final List<OrderItem> orderItems;
  final OrderStatus orderStatus;
  final CustomerDetails customerDetails;
  final PaymentDetails paymentDetails;
  final OrderType? orderType;

  bool get orderCompleted => orderItems.isNotEmpty;

  double get totalOrderCost =>
      orderItems.fold(0, (total, orderItem) => total + orderItem.totalCost);

  OrderState({
    required this.orderItems,
    required this.orderStatus,
    required this.customerDetails,
    required this.paymentDetails,
    this.orderType,
  });

  OrderState copyWith({
    List<OrderItem>? orderItems,
    OrderStatus? orderStatus,
    CustomerDetails? customerDetails,
    PaymentDetails? paymentDetails,
    bool? validate,
    bool? ordersPlacedVisible,
}) => OrderState(
        orderItems: orderItems ?? this.orderItems,
        orderStatus: orderStatus ?? this.orderStatus,
        customerDetails: customerDetails ?? this.customerDetails,
        paymentDetails: paymentDetails ?? this.paymentDetails,
    );
}

class PaymentDetails {
  final String cardNumber;
  final String expiryYear;
  final String expiryMonth;
  final String cvv;

  PaymentDetails({
    required this.cardNumber,
    required this.expiryYear,
    required this.expiryMonth,
    required this.cvv,
  });
}

class CustomerDetails {
  final String name;
  final String address;
  final String phone;

  CustomerDetails({
    required this.name,
    required this.address,
    required this.phone,
  });
}

extension StringExtensions on String {
  String get removeEmptySpace => replaceAll(" ", "");

  String get capitalizeFirstLetter {
    if (isEmpty) {
      return this;
    }
    return this[0].toUpperCase() + substring(1);
  }
}