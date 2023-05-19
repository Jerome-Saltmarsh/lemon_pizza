

import 'package:flutter/material.dart';

import 'animate.dart';

/// Flutter code sample for [AnimatedBuilder].

class AnimateCurved extends StatelessWidget {

  final Curve curve;
  final Widget Function(BuildContext context, Widget? child, double value) builder;

  const AnimateCurved({
    super.key,
    this.curve = Curves.easeInOutQuad,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) => Animate(
        buildAnimation: (controller) => CurvedAnimation(
          parent: controller,
          curve: curve,
        ),
      builder: builder,
    );

}
