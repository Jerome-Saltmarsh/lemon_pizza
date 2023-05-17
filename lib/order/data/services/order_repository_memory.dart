
import 'dart:math';

import 'package:lemon_pizza/order/data/repositories/order_repository.dart';

class OrderRepositoryMemory implements OrderRepository {

  final random = Random();

  @override
  Future submitOrder() async  {
    return Future.delayed(const Duration(seconds: 2), (){
        if (random.nextBool()) throw Exception('Insufficient Funds');
    });
  }
}