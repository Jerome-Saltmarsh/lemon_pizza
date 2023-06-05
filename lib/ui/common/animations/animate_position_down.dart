import 'package:flutter/cupertino.dart';
import 'package:lemon_pizza/ui/common/extensions/build_context_extension.dart';
import 'package:lemon_widgets/lemon_widgets.dart';

class AnimatePositionDown extends StatelessWidget {
  final Widget child;

  const AnimatePositionDown({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatePosition(
      duration: context.readThemeState.animationDuration,
      curve: Curves.easeOut,
      side: Side.top,
      start: 0,
      end: 50,
      child: child,
    );
  }
}
