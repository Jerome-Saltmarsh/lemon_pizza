
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lemon_pizza/blocs/order/order_bloc.dart';
import 'package:lemon_pizza/ui/functions/format_dollars.dart';
import 'package:lemon_pizza_domain/lemon_pizza_domain.dart';
import 'package:lemon_widgets/lemon_widgets.dart';

class OrderItemsColumnItem extends StatelessWidget {

  final OrderItem orderItem;

  const OrderItemsColumnItem({super.key, required this.orderItem});

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;

    return FadeIn(
      child: Container(
        margin: const EdgeInsets.only(top: 8),
        padding: const EdgeInsets.only(top: 8),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: colorScheme.secondary,
              width: 1.0,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(orderItem.pizzaType.name, style: TextStyle(color: colorScheme.tertiary),),
                Text(orderItem.pizzaSize.name, style: TextStyle(color: colorScheme.secondary)),
                Text(formatDollars(orderItem.totalCost), style: TextStyle(color: colorScheme.secondary)),
              ],
            ),
            TextButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                        (Set<MaterialState> states) {
                      return colorScheme.secondaryContainer; // Default color
                    },
                  )
              ),
              child: Text("remove", style: TextStyle(color: colorScheme.onSecondaryContainer),),
              onPressed: ()  {
                context.read<OrderBloc>().removeOrderItem(orderItem);
              },
            ),
          ],
        ),
      ),
    );
  }

}