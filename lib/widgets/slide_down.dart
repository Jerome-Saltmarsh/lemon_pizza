
import 'package:flutter/cupertino.dart';
import 'package:lemon_pizza/widgets/animate_curved.dart';

class SlideDown extends StatelessWidget {

  final Widget child;

  const SlideDown({required this.child, super.key});

  @override
  Widget build(BuildContext context) => AnimateCurved(
        curve: Curves.bounceOut,
        builder: (context, child, value) {
          return Positioned(top: value * 100, child: this.child);
        }
    );
}