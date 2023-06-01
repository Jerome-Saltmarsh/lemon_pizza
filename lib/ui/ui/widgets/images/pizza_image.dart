

import 'package:flutter/cupertino.dart';

class PizzaImage extends StatelessWidget {
  const PizzaImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/images/pizza_icon.png', fit: BoxFit.contain,);
  }
}