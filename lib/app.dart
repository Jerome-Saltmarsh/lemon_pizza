import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lemon_pizza/home.dart';
import 'package:lemon_pizza/order/bloc/order_bloc.dart';
import 'package:lemon_pizza/order/bloc/order_state.dart';
import 'package:lemon_pizza/order/data/repositories/order_repository.dart';

class App extends StatelessWidget {

  final OrderRepository orderRepository;

  const App({super.key, required this.orderRepository});

  @override
  Widget build(BuildContext context) =>
      MultiBlocProvider(
        providers: [
          BlocProvider<OrderBloc>(create: (context) =>
              OrderBloc(
                OrderState(
                  orderItems: [],
                  orderStatus: OrderStatus.createOrder,
                  validate: false,
                ),
                orderRepository: orderRepository
              )
          ),
        ],
        child: MaterialApp(
          title: 'ORDER PIZZA',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const Home(),
        ),
      );
}
