import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lemon_pizza/home.dart';
import 'package:lemon_pizza/order/bloc/order_bloc.dart';
import 'package:lemon_pizza/order/bloc/order_enums.dart';
import 'package:lemon_pizza/order/bloc/order_state.dart';
import 'package:lemon_pizza/order/data/repositories/order_repository.dart';
import 'package:lemon_pizza/order/data/services/order_repository_memory.dart';
import 'package:lemon_pizza/theme/bloc/theme_bloc.dart';

import 'color_schemes.dart';

class App extends StatelessWidget {

  const App({super.key});

  @override
  Widget build(BuildContext context) =>
      RepositoryProvider<OrderRepository>(
        create: (context) => OrderRepositoryMemory(),
        child: MultiBlocProvider(
          providers: [
            BlocProvider<ThemeBloc>(create: (context)=> ThemeBloc()),
            BlocProvider<OrderBloc>(create: (context) =>
                OrderBloc(
                    OrderState(
                      orderItems: [],
                      orderStatus: OrderStatus.createOrder,
                      validate: false,
                      customerDetails: CustomerDetails(
                          name: '',
                          address: '',
                          phone: ''
                      ),
                      paymentDetails: PaymentDetails(),
                      ordersPlacedVisible: false,
                    ),
                    orderRepository: RepositoryProvider.of(context)
                )
            ),
          ],
          child: Builder(
            builder: (context) {
              return MaterialApp(
                title: 'ORDER PIZZA',
                debugShowCheckedModeBanner: false,
                themeMode: context.watch<ThemeBloc>().state,
                darkTheme: ThemeData().copyWith(
                  useMaterial3: true,
                  colorScheme: ColorSchemes.dark,
                  appBarTheme: const AppBarTheme().copyWith(
                    backgroundColor: ColorSchemes.dark.onPrimaryContainer,
                    foregroundColor: ColorSchemes.dark.primaryContainer,
                    centerTitle: true,
                  ),
                  textTheme: ThemeData().textTheme.copyWith(

                  ),
                ),
                theme: ThemeData().copyWith(
                    useMaterial3: true,
                    colorScheme: ColorSchemes.light,
                    appBarTheme: const AppBarTheme().copyWith(
                      backgroundColor: ColorSchemes.light.onPrimaryContainer,
                      foregroundColor: ColorSchemes.light.primaryContainer,
                      centerTitle: true,
                    ),
                    textTheme: ThemeData().textTheme.copyWith(

                    ),
                ),
                home: const Home(),
              );
            }
          ),
        ),
      );
}
