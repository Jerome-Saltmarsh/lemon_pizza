
import 'package:lemon_pizza_model/src/types/order.dart';

import 'order_api_submit_response.dart';

abstract class OrderApi {
  Future<OrderApiSubmitResponse> submit(Order order);
}

