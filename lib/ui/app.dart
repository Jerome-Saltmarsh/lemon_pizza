import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lemon_pizza/blocs/order/order_enums.dart';
import 'package:lemon_pizza/blocs/order/order_state.dart';
import 'package:lemon_pizza/blocs/theme/theme_state.dart';

import '../blocs/order/order_bloc.dart';
import '../blocs/order/order_repository.dart';
import '../blocs/theme/theme_bloc.dart';
import '../data/order_repository_memory.dart';
import 'common/theme/theme_page.dart';
import 'desktop/scaffold_desktop.dart';
import 'mobile/scaffold_mobile.dart';

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
                    animationDuration: const Duration(milliseconds: 200),
                    themeMode: ThemeMode.system,
                    color: Colors.green,
                    dialogBorderRadius: BorderRadius.circular(4),
                    dialogBorderWidth: 2,
                    dialogPadding: const EdgeInsets.all(8),
                    fontSize: FontSize(
                      largest: 34,
                      extraLarge: 26,
                      large: 24,
                      regular: 22,
                      small: 20,
                      extraSmall: 18,
                    )))),
            BlocProvider<OrderBloc>(
                create: (context) => OrderBloc(
                    OrderState(
                      orderItems: [],
                      orderStatus: OrderStatus.paymentSucceeded,
                      customerDetails: CustomerDetails(
                          name: '',
                          address: '',
                          phone: ''
                      ),
                      paymentDetails: PaymentDetails(
                        cardNumber: '',
                        expiryYear: '',
                        expiryMonth:  '',
                        cvv: '',
                      ),
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
                home: LayoutBuilder(builder: (context, constraints) =>
                constraints.maxWidth > 700
                    ? const ScaffoldDesktop()
                    : const ScaffoldMobile()),
              );
            }
          ),
        ),
      );
}
