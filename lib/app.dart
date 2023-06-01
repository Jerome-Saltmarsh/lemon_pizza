import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lemon_pizza/home.dart';

import 'blocs/order/bloc/order_bloc.dart';
import 'blocs/order/bloc/order_enums.dart';
import 'blocs/order/bloc/order_state.dart';
import 'blocs/order/data/repositories/order_repository.dart';
import 'blocs/order/data/services/order_repository_memory.dart';
import 'blocs/theme/bloc/theme_bloc.dart';
import 'blocs/theme/bloc/theme_state.dart';
import 'blocs/theme/ui/theme_page.dart';

class App extends StatelessWidget {

  const App({super.key});

  @override
  Widget build(BuildContext context) =>
      RepositoryProvider<OrderRepository>(
        create: (context) => OrderRepositoryMemory(),
        child: MultiBlocProvider(
          providers: [
            BlocProvider<ThemeBloc>(
                create: (context) => ThemeBloc(ThemeState(
                    themeMode: ThemeMode.system,
                    color: Colors.green,
                    fontSize: FontSize(
                      extraLarge: 20,
                      large: 18,
                      regular: 16,
                      small: 14,
                      extraSmall: 12,
                    )))),
            BlocProvider<OrderBloc>(
                create: (context) => OrderBloc(
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
              final themeState = context.watch<ThemeBloc>().state;
              return MaterialApp(
                title: 'PIZZA',
                debugShowCheckedModeBanner: false,
                themeMode: themeState.themeMode,
                darkTheme: themeState.themeDataDark,
                theme: themeState.themeDataLight,
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
