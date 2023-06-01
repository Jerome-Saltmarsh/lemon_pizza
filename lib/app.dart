import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lemon_pizza/home.dart';
import 'package:lemon_pizza/order/bloc/order_bloc.dart';
import 'package:lemon_pizza/order/bloc/order_enums.dart';
import 'package:lemon_pizza/order/bloc/order_state.dart';
import 'package:lemon_pizza/order/data/repositories/order_repository.dart';
import 'package:lemon_pizza/order/data/services/order_repository_memory.dart';
import 'package:lemon_pizza/theme/bloc/theme_bloc.dart';
import 'package:lemon_pizza/theme/ui/theme_page.dart';

import 'style.dart';

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
                title: 'PIZZA',
                debugShowCheckedModeBanner: false,
                themeMode: context.watch<ThemeBloc>().state,
                darkTheme: Style.themeDataDark,
                theme: Style.themeDataLight,
                routes: {
                  "theme": (context){
                    return const ThemePage();
                  }
                },
                home: const Home(),
              );
            }
          ),
        ),
      );
}
