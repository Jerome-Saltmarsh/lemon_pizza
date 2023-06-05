
import 'package:flutter/cupertino.dart';
import 'package:lemon_pizza/ui/common/extensions/build_context_extension.dart';
import 'package:lemon_widgets/lemon_widgets.dart';

class TitleText extends StatelessWidget {
  const TitleText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
            width: 100,
            child: Image.asset('assets/images/pizza.png', fit: BoxFit.fitWidth, color: context.colorScheme.onSurface,)),
        const SizedBox(width: 16,),
        Text(
          "PIZZA-BOX",
          style: TextStyle(
              color: context.colorScheme.onSurfaceVariant,
              fontSize: context.fontSize.largest,
              fontFamily: 'CabinSketch'
          ),
        ),
      ],
    );
  }
}