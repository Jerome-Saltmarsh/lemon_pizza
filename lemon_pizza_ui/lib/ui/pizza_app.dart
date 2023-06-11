import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lemon_pizza_domain/lemon_pizza_domain.dart';
import 'package:lemon_pizza_ui/blocs/device/device_bloc.dart';
import 'package:lemon_pizza_ui/blocs/device/device_type.dart';
import 'package:lemon_pizza_ui/blocs/select/select_bloc.dart';
import 'package:lemon_pizza_ui/blocs/theme/theme_state.dart';

import '../blocs/order/order_bloc.dart';
import '../blocs/theme/theme_bloc.dart';
import '../data/order_repository_memory.dart';
import 'pizza_app_scaffold.dart';

class PizzaApp extends StatelessWidget {
  const PizzaApp({super.key});

  @override
  Widget build(BuildContext context) => RepositoryProvider<OrderRepository>(
        create: (context) => OrderRepositoryMemory(),
        child: MultiBlocProvider(
          providers: [
            BlocProvider<DeviceBloc>(
              create: (context) => DeviceBloc(DeviceType.desktop),
            ),
            BlocProvider<SelectBloc>(
              create: (context) => SelectBloc(),
            ),
            BlocProvider<ThemeBloc>(
                create: (context) => ThemeBloc(ThemeState(
                    animationDuration: const Duration(milliseconds: 200),
                    themeMode: ThemeMode.system,
                    color: Colors.green,
                    dialogBorderRadius: BorderRadius.circular(4),
                    dialogBorderWidth: 2,
                    dialogPadding: const EdgeInsets.all(16),
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
                    Order(
                      orderItems: [],
                      orderStatus: OrderStatus.paymentFailed,
                      customerDetails:
                          CustomerDetails(name: '', address: '', phone: ''),
                      paymentDetails: PaymentDetails(
                        cardNumber: '',
                        expiryYear: '',
                        expiryMonth: '',
                        cvv: '',
                      ),
                    ),
                    orderRepository: RepositoryProvider.of(context))),
          ],
          child: LayoutBuilder(builder: (builderContext, size) {

            builderContext.read<DeviceBloc>().update(builderContext);

            final themeState = builderContext.watch<ThemeBloc>().state;
            return MaterialApp(
              title: 'PIZZA',
              debugShowCheckedModeBanner: false,
              themeMode: themeState.themeMode,
              darkTheme: themeState.themeDataDark,
              theme: themeState.themeDataLight,
              home: const PizzaAppScaffold(),
            );
          }),
        ),
      );
}
