import 'package:lemon_pizza_domain/lemon_pizza_domain.dart';

class OrderApiSubmitResponse {
   final Order order;
   final OrderApiSubmitResponseStatus status;

   OrderApiSubmitResponse({required this.order, required this.status});
}