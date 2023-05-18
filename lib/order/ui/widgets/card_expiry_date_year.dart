
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:lemon_pizza/order/bloc/order_bloc.dart';
import 'package:lemon_pizza/order/ui/widgets/order_bloc_builder.dart';

class ExpiryDateYear extends StatelessWidget {
  const ExpiryDateYear({super.key});

  @override
  Widget build(BuildContext context) =>
      OrderBlocBuilder(
        buildWhen: (previous, current) =>
        previous.paymentDetails.expiryYear != current.paymentDetails.expiryYear,
        builder: (context, orderState){
          return DropdownButton<int>(
            hint: const Text("Year"),
            value: orderState.paymentDetails.expiryYear,
            items: List.generate(10, (index) => DateTime.now().year + index).map((year) => DropdownMenuItem(
              value: year,
              child: Text(year.toString()),
            )).toList(),
            onChanged: (expiryYear) {
              context.read<OrderBloc>()
                  .emitPaymentDetails(expiryYear: expiryYear);
            },
          );
        },
    );
}