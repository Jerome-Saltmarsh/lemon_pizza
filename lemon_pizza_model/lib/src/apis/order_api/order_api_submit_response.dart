import 'package:lemon_pizza_model/src/types/order.dart';

import 'order_api_submit_response_status.dart';

class OrderApiSubmitResponse {
   final Order order;
   final OrderApiSubmitResponseStatus status;

   OrderApiSubmitResponse({required this.order, required this.status});
}