
import 'package:flutter/material.dart';
import 'package:lemon_pizza/ui/font_families.dart';
import 'package:lemon_pizza/ui/extensions/build_context_extension.dart';
import 'package:lemon_pizza/ui/widgets/animations/animate_position_down.dart';

class OrderTypeView extends StatelessWidget {
  const OrderTypeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        AnimatePositionDown(
          child: Container(
            width: 500,
            height: 400,
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: context.selectOrderTypePickup,
                    child: Text("PICKUP", style: TextStyle(
                      fontFamily: FontFamilies.secondary,
                      fontSize: context.fontSize.large,
                    ),)
                ),
                TextButton(
                    onPressed: context.selectOrderTypeDeliver,
                    child: Text("DELIVER", style: TextStyle(
                      fontFamily: FontFamilies.secondary,
                      fontSize: context.fontSize.large,
                    ))
                ),
              ],
            ),
          ),
        )
      ]
    );
  }
}