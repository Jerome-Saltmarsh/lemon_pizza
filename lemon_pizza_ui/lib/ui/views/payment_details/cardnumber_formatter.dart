import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CardNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    final originalText = newValue.text.replaceAll(" ", "");
    var text = "";
    for (var i = 0; i < originalText.length; i++) {
      if (i > 0 && i % 4 == 0) {
        text += " ";
      }
      text += originalText.characters.elementAt(i);
    }
    var offset = oldValue.selection.end + 1;

    if (oldValue.selection.end == 04 ||
        oldValue.selection.end == 09 ||
        oldValue.selection.end == 14 ||
        oldValue.selection.end == 19) {
      offset++;
    }
    return TextEditingValue(
      text: text,
      selection: TextSelection.collapsed(offset: offset),
    );
  }
}