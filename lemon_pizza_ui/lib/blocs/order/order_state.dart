//
//
//
// import 'package:lemon_pizza_domain/lemon_pizza_domain.dart';
//
// class OrderState {
//   final List<OrderItem> orderItems;
//   final OrderStatus orderStatus;
//   final CustomerDetails customerDetails;
//   final PaymentDetails paymentDetails;
//   final OrderType? orderType;
//
//   bool get orderCompleted => orderItems.isNotEmpty;
//
//   double get totalOrderCost =>
//       orderItems.fold(0, (total, orderItem) => total + orderItem.totalCost);
//
//   OrderState({
//     required this.orderItems,
//     required this.orderStatus,
//     required this.customerDetails,
//     required this.paymentDetails,
//     this.orderType,
//   });
//
//   OrderState copyWith({
//     List<OrderItem>? orderItems,
//     OrderStatus? orderStatus,
//     CustomerDetails? customerDetails,
//     PaymentDetails? paymentDetails,
//     bool? validate,
//     bool? ordersPlacedVisible,
// }) => OrderState(
//         orderItems: orderItems ?? this.orderItems,
//         orderStatus: orderStatus ?? this.orderStatus,
//         customerDetails: customerDetails ?? this.customerDetails,
//         paymentDetails: paymentDetails ?? this.paymentDetails,
//     );
// }
//
// extension StringExtensions on String {
//   String get removeEmptySpace => replaceAll(" ", "");
//
//   String get capitalizeFirstLetter {
//     if (isEmpty) {
//       return this;
//     }
//     return this[0].toUpperCase() + substring(1);
//   }
// }