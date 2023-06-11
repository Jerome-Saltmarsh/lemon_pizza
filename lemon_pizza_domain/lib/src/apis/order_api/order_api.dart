
import 'package:lemon_pizza_domain/lemon_pizza_domain.dart';

abstract class OrderApi {
  Future<OrderApiSubmitResponse> submit(Order order);
}

