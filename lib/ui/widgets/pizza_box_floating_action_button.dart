
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lemon_pizza/blocs/layout/layout_bloc.dart';
import 'package:lemon_pizza/blocs/order/order_bloc.dart';
import 'package:lemon_pizza/model/order_status.dart';
import 'package:lemon_pizza/ui/extensions/build_context_extension.dart';
import 'package:lemon_widgets/lemon_widgets.dart';

import 'order_bloc_builder.dart';

class PizzaBoxFloatingActionButton extends StatelessWidget {
  const PizzaBoxFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    if (context.watch<LayoutBloc>().isDesktop) return const SizedBox();


    final fontSize = context.fontSize;
    final colorScheme = context.colorScheme;

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
               icon: Icon(Icons.shopping_cart, size: 35, color: colorScheme.primary,),
               onPressed: (){
                  context.read<OrderBloc>().setOrderStatus(OrderStatus.reviewOrder);
               },
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
                         color: context.colorScheme.error,
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