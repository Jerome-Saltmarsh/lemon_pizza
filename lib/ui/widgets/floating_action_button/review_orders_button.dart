
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lemon_pizza/blocs/order/order_bloc.dart';
import 'package:lemon_pizza/model/order_status.dart';
import 'package:lemon_pizza/ui/extensions/build_context_extension.dart';
import 'package:lemon_pizza/ui/widgets/order_bloc_builder.dart';
import 'package:lemon_widgets/lemon_widgets.dart';

class ReviewOrdersButton extends StatelessWidget {
  const ReviewOrdersButton({super.key});

  @override
  Widget build(BuildContext context) {
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
                  child: SizedBox(
                    width: 25,
                    height: 25,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: context.colorScheme.error,
                            shape: BoxShape.circle,
                          ),
                        ),

                        Positioned(
                          top: -5,
                          child: Text(orderState.orderItems.length.toString(),
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(color: Colors.white, fontSize: fontSize.regular, )
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }

}