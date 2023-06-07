
import 'package:flutter/cupertino.dart';

class PizzaSizeDialogColumn extends StatelessWidget {
  const PizzaSizeDialogColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(children: [
         Text("SMALL"),
         Text("MEDIUM"),
         Text("LARGE"),
    ],);
  }
}