import 'package:lemon_pizza_domain/lemon_pizza_domain.dart';

class OrderRepositorySubmitResponse {
   final Order order;
   final OrderRepositorySubmitResponseStatus status;

   OrderRepositorySubmitResponse({required this.order, required this.status});
}