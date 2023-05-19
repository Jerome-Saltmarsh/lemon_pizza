

import 'package:flutter/material.dart';

class Animate extends StatefulWidget {

  final Widget? child;
  final Duration duration;
  final Widget Function(BuildContext context, Widget? child, double value) builder;
  final Animation<double> Function(AnimationController controller) buildAnimation;

  const Animate({
    super.key,
    required this.builder,
    required this.buildAnimation,
    this.child,
    this.duration = const Duration(milliseconds: 300),
  });

  @override
  State<Animate> createState() => _AnimateState();
}

/// AnimationControllers can be created with `vsync: this` because of
/// TickerProviderStateMixin.
class _AnimateState extends State<Animate>
    with TickerProviderStateMixin {

  late final Animation<double> _animation;
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );
    _animation = widget.buildAnimation(_controller);
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
