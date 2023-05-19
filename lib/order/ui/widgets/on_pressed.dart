
import 'package:flutter/material.dart';

class OnPressed extends StatelessWidget {

  final Function? action;
  final Widget child;
  final String? hint;

  const OnPressed({this.action, super.key, required this.child, this.hint});

  @override
  Widget build(BuildContext context) {
    final widget = MouseRegion(
        cursor: action != null
            ? SystemMouseCursors.click
            : SystemMouseCursors.basic,
        child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => action?.call(),
            child: child
        ));

    if (hint == null) return widget;
    return Tooltip(
      message: hint,
      child: widget,
    );
  }

}