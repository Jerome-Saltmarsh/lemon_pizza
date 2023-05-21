
import 'package:flutter/cupertino.dart';

class OrderTypeView extends StatelessWidget {
  const OrderTypeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text("Select order type"),
        Text("PICKUP"),
        Text("DELIVER"),
      ],
    );
  }
}