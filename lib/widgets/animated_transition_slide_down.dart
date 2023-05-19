import 'package:flutter/material.dart';
import 'package:lemon_pizza/widgets/nothing.dart';

/// Flutter code sample for [AnimatedBuilder].

class AnimatedTransitionSlideDown extends StatefulWidget {

  final Widget child;

  const AnimatedTransitionSlideDown({super.key, required this.child});

  @override
  State<AnimatedTransitionSlideDown> createState() => _AnimatedTransitionSlideDownState();
}

/// AnimationControllers can be created with `vsync: this` because of
/// TickerProviderStateMixin.
class _AnimatedTransitionSlideDownState extends State<AnimatedTransitionSlideDown>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 250),
    vsync: this,
  );

  @override
  void initState() {
    super.initState();
    _controller.forward(from: 0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return AnimatedBuilder(
      animation: _controller,
      child: widget.child,
      builder: (BuildContext context, Widget? child) {
        return Positioned(top: _controller.value * 100, child: child ?? nothing);
      },
    );
  }
}
