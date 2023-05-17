import 'package:flutter/material.dart';
import 'package:lemon_pizza/app.dart';
import 'package:lemon_pizza/order/data/services/order_repository_memory.dart';

void main() {
  runApp(App(orderRepository: OrderRepositoryMemory()));
}

