
import 'package:flutter/cupertino.dart';
import 'package:lemon_pizza/widgets/animate.dart';

class SlideDown extends StatelessWidget {

  final Widget child;

  const SlideDown({required this.child, super.key});

  @override
  Widget build(BuildContext context) => Animate(
        builder: (context, child, value) {
          return Positioned(top: value * 100, child: this.child);
        }
    );
}