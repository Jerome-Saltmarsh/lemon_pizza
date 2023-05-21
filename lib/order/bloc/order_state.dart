
import 'package:lemon_pizza/order/ui/extensions/string_extensions.dart';

import 'order_enums.dart';

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
  final bool validate;
  final PizzaType? selectedPizzaType;
  final PizzaSize selectedPizzaSize;
  final bool ordersPlacedVisible;
  final OrderType orderType;

  bool get orderCompleted => orderItems.isNotEmpty;

  double get totalOrderCost =>
      orderItems.fold(0, (total, orderItem) => total + orderItem.totalCost);

  OrderState({
    required this.orderItems,
    required this.orderStatus,
    required this.validate,
    required this.customerDetails,
    required this.paymentDetails,
    required this.ordersPlacedVisible,
    this.orderType = OrderType.pickup,
    this.selectedPizzaType,
    this.selectedPizzaSize = PizzaSize.medium,
  });
}

class PaymentDetails {
  final String cardHolderName;
  final String cardNumber;
  final int? expiryYear;
  final int? expiryMonth;
  final int? cvv;

  PaymentDetails({
    this.cardHolderName = '',
    this.cardNumber = '',
    this.expiryYear,
    this.expiryMonth,
    this.cvv,
  });

  bool get valid =>
      cardNumberValid &&
      cardHolderNameValid &&
      expiryYear != null &&
      expiryMonth != null &&
      cvvValid;

  bool get cvvValid =>
      cvv != null &&
      cvv.toString().length == 3;

  bool get cardHolderNameValid =>
      cardHolderName.isNotEmpty;

  bool get cardNumberValid =>
      cardNumber.removeEmptySpace.length >= 16 &&
      cardNumber.removeEmptySpace.length <= 19;

  String? get cardNumberInvalidReason {
    if (cardNumber.removeEmptySpace.length < 16){
      return 'too short';
    }
    if (cardNumber.removeEmptySpace.length > 19){
      return 'too long';
    }
    return null;
  }
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

  bool get valid {
    return name.isNotEmpty && address.isNotEmpty && phone.isNotEmpty;
  }
}
