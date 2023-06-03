
import 'package:flutter/cupertino.dart';
import 'package:lemon_pizza/ui/common/extensions/build_context_extension.dart';
import 'package:lemon_widgets/lemon_widgets.dart';

class TitleText extends StatelessWidget {
  const TitleText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "PIZZA-ONLINE",
      style: TextStyle(
          color: context.colorScheme.onPrimary,
          fontSize: context.fontSize.largest,
          fontFamily: 'CabinSketch'
      ),
    );
  }
}