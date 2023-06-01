
import 'package:flutter/cupertino.dart';
import 'package:lemon_widgets/lemon_widgets.dart';

class TextOnPrimary extends StatelessWidget {

  final String value;
  final double fontSize;
  const TextOnPrimary(this.value, {super.key, required this.fontSize});

  @override
  Widget build(BuildContext context) =>
      Text(value, style: TextStyle(color: context.colorScheme.onPrimary, fontSize: fontSize));
}