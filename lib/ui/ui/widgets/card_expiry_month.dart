
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lemon_pizza/blocs/order/order_bloc.dart';
import 'package:lemon_pizza/ui/ui/widgets/order_bloc_builder.dart';

class CardExpiryMonth extends StatelessWidget {
  const CardExpiryMonth({super.key});

  @override
  Widget build(BuildContext context) =>
      OrderBlocBuilder(
        buildWhen: (previous, current) =>
        previous.paymentDetails.expiryMonth != current.paymentDetails.expiryMonth,
        builder: (context, orderState){
          return DropdownButton<int>(
            hint: const Text("Month"),
            value: orderState.paymentDetails.expiryMonth,
            items: List.generate(12, (month) => DropdownMenuItem(
                value: month + 1,
                child: Text((month + 1).toString()),
              )
            ),
            onChanged: (month) {
              context.read<OrderBloc>()
                  .emitPaymentDetails(expiryMonth: month);
            },
          );
        },
      );
}