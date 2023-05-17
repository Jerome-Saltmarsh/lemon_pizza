
enum PizzaType {
  margherita,
  godFather,
  vegetarian,
  mexican,
  seafood,
  salami,
}

enum OrderStatus {
  createOrder,
  customerDetails,
  paymentDetails,
  paymentInProgress,
  paymentSucceeded,
  paymentFailed,
}

class OrderItem {
   final PizzaType pizzaType;
   OrderItem(this.pizzaType);
}

class OrderState {
  final List<OrderItem> orderItems;
  final OrderStatus orderStatus;
  final CustomerDetails customerDetails;
  final PaymentDetails paymentDetails;
  final bool validate;

  OrderState({
    required this.orderItems,
    required this.orderStatus,
    required this.validate,
    required this.customerDetails,
    required this.paymentDetails,
  });

  OrderStatus get nextOrderStatus {
     switch (orderStatus){
       case OrderStatus.createOrder:
         return OrderStatus.customerDetails;
       case OrderStatus.customerDetails:
         return OrderStatus.paymentDetails;
       case OrderStatus.paymentDetails:
         return OrderStatus.paymentInProgress;
       case OrderStatus.paymentFailed:
         return OrderStatus.paymentDetails;
       case OrderStatus.paymentSucceeded:
         return OrderStatus.createOrder;
       case OrderStatus.paymentInProgress:
         return OrderStatus.paymentInProgress;
     }
  }
}

class PaymentDetails {
  final int? cardNumber;
  final int? expiryYear;
  final int? expiryMonth;
  final int? cvv;

  PaymentDetails({
    this.cardNumber,
    this.expiryYear,
    this.expiryMonth,
    this.cvv,
  });

  bool get valid =>
      cardNumberValid &&
      expiryYear    != null &&
      expiryMonth   != null &&
      cvvValid ;

  bool get cvvValid =>
      cvv != null &&
      cvv.toString().length != 3;

  bool get cardNumberValid =>
      cardNumber != null &&
      cardNumber.toString().length >= 16;
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
