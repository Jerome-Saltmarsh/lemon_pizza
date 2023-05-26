
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lemon_pizza/order/bloc/order_bloc.dart';
import 'package:lemon_pizza/order/ui/widgets/order_bloc_builder.dart';
import 'package:lemon_widgets/lemon_widgets.dart';

class CheckoutIcon extends StatelessWidget {
  const CheckoutIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return OrderBlocBuilder(
       buildWhen: (previous, current){
         return previous.orderItems.length != current.orderItems.length;
       },
       builder: (context, orderState){
         return Stack(
           clipBehavior: Clip.none,
           alignment: Alignment.center,
           children: [
             IconButton(
               icon: const Icon(Icons.shopping_cart, size: 35),
               onPressed: context.read<OrderBloc>().toggleOrdersVisible,
             ),
             if (orderState.orderItems.isNotEmpty)
               Positioned(
                 top: -5,
                 right: -10,
                 child: IgnorePointer(
                   child: Container(
                       width: 25,
                       height: 25,
                       alignment: Alignment.center,
                       decoration: BoxDecoration(
                         shape: BoxShape.circle,
                         color: context.theme.colorScheme.error,
                       ),
                       child: Text(orderState.orderItems.length.toString(),
                           style: const TextStyle(color: Colors.white, fontSize: 12)
                       )
                   ),
                 ),
               ),
           ],
         );
       },
    );
  }
}