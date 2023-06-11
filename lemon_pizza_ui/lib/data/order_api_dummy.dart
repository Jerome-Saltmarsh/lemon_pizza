
import 'dart:math';

import 'package:lemon_pizza_domain/lemon_pizza_domain.dart';


class OrderApiDummy implements OrderApi {
  final random = Random();

  @override
  Future<OrderApiSubmitResponse> submit(Order order) async {
    await Future.delayed(Duration(seconds: 3 + random.nextInt(3)));
    return OrderApiSubmitResponse(
      order: order,
      status: random.nextBool()
          ? OrderApiSubmitResponseStatus.failed
          : OrderApiSubmitResponseStatus.succeeded,
    );
  }
}

