import 'package:flutter/material.dart';
import 'package:lemon_pizza/ui/scaffold_mobile.dart';

import 'ui/scaffold_desktop.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) =>
      constraints.maxWidth > 500
          ?  const ScaffoldDesktop()
          : const ScaffoldMobile());
  }
}
