

import 'package:flutter/material.dart';

/// Flutter code sample for [AnimatedBuilder].

class Animate extends StatefulWidget {

  final Widget? child;
  final Duration duration;
  final Widget Function(BuildContext context, Widget? child, double value) builder;

  const Animate({
    super.key,
    required this.builder,
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

  late final _controller = AnimationController(
    duration: widget.duration,
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
  Widget build(BuildContext context) => AnimatedBuilder(
      animation: _controller,
      child: widget.child,
      builder: (BuildContext context, Widget? child) =>
          widget.builder(context, child, _controller.value),
    );
}
