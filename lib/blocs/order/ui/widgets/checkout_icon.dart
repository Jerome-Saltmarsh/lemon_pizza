
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lemon_pizza/blocs/order/bloc/order_bloc.dart';
import 'package:lemon_pizza/ui/extensions/build_context_extension.dart';
import 'package:lemon_widgets/lemon_widgets.dart';

import 'order_bloc_builder.dart';

class CheckoutIcon extends StatelessWidget {
  const CheckoutIcon({super.key});

  @override
  Widget build(BuildContext context) {
    final fontSize = context.fontSize;

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
               icon: Icon(Icons.shopping_cart, size: 35, color: context.colorScheme.onPrimary,),
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
                       decoration: const BoxDecoration(
                         shape: BoxShape.circle,
                         color: Colors.red,
                       ),
                       child: Text(orderState.orderItems.length.toString(),
                           style: TextStyle(color: Colors.white, fontSize: fontSize.regular)
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