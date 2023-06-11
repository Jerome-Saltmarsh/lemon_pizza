

import 'package:flutter/cupertino.dart';

class PizzaSizeImage extends StatelessWidget {
  const PizzaSizeImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/images/pizza-size.png', fit: BoxFit.contain,);
  }
}