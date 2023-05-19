

import 'package:flutter/material.dart';

/// Flutter code sample for [AnimatedBuilder].

class Animate extends StatefulWidget {

  final Widget? child;
  final Duration duration;
  final Curve curve;
  final Widget Function(BuildContext context, Widget? child, double value) builder;

  const Animate({
    super.key,
    required this.builder,
    this.child,
    this.curve = Curves.easeInOutQuad,
    this.duration = const Duration(milliseconds: 300),
  });

  @override
  State<Animate> createState() => _AnimateState();
}

/// AnimationControllers can be created with `vsync: this` because of
/// TickerProviderStateMixin.
class _AnimateState extends State<Animate>
    with TickerProviderStateMixin {

  late Animation<double> _animation;

  late final _controller = AnimationController(
    duration: widget.duration,
    vsync: this,
  );

  @override
  void initState() {
    super.initState();
    _animation = CurvedAnimation(
      parent: _controller,
      curve: widget.curve,
    );
    _controller.forward(from: 0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
      animation: _animation,
      child: widget.child,
      builder: (BuildContext context, Widget? child) =>
          widget.builder(context, child, _animation.value),
    );
}
