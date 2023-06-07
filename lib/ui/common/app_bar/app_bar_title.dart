
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lemon_pizza/ui/common/extensions/build_context_extension.dart';
import 'package:lemon_widgets/lemon_widgets.dart';

class AppBarTitle extends StatelessWidget {

  final bool compact;

  const AppBarTitle({super.key, required this.compact});

  @override
  Widget build(BuildContext context) {
    final color = context.colorScheme.onSurfaceVariant;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
           padding: const EdgeInsets.all(5),
           decoration: BoxDecoration(
             color: context.colorScheme.surfaceVariant,
             shape: BoxShape.rectangle,
             border: Border.all(
               color: color,
               width: 1,
             ),
             borderRadius: context.readThemeState.dialogBorderRadius,
           ),
            // width: compact ? 50 : 80,
            width: 50,
            child: Image.asset('assets/images/pizza.png', fit: BoxFit.fitWidth, color: color,)),
        if (!compact)
          Row(
            children: [
              const SizedBox(width: 16,),
              Text(
                "PIZZA-BOX",
                style: TextStyle(
                    color: color,
                    fontSize: context.fontSize.largest,
                    fontFamily: 'CabinSketch'
                ),
              ),
            ],
          )

      ],
    );
  }
}