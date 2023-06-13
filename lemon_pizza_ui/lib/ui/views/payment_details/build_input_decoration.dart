import 'package:flutter/material.dart';
import 'package:lemon_pizza_ui/ui/extensions/build_context_extension.dart';
import 'package:lemon_pizza_ui/ui/font_families.dart';
import 'package:lemon_widgets/lemon_widgets.dart';

InputDecoration buildInputDecoration({
  required BuildContext context,
  required String label,
  String? error,
  Widget? prefixIcon,
  Color? prefixIconColor,
}){

  final color = context.colorScheme.secondary;
  final style = TextStyle(
    fontFamily: FontFamilies.roboto,
    color: color.withOpacity(0.5),
    fontSize:  context.fontSize.regular,
  );

  return InputDecoration(
    prefixIcon: prefixIcon,
    prefixIconColor: prefixIconColor,
    counterText: '',
    label: Text(label, style: style),
    labelStyle: style,
    focusColor: color,
    fillColor: color,
    errorStyle: TextStyle(
      fontFamily: FontFamilies.roboto,
      color: context.colorScheme.error,
      fontSize:  context.fontSize.regular,
    ),
    errorText: error,
    border: OutlineInputBorder(
      borderSide: BorderSide(color: color),
      borderRadius: context.readThemeState.dialogBorderRadius,
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: color),
      borderRadius: context.readThemeState.dialogBorderRadius,
    ),
  );
}

