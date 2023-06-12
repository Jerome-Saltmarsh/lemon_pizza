
import 'package:flutter/services.dart';


class InputFormatters {
  static final numbersOnlyFormatter = FilteringTextInputFormatter.allow(RegExp(r'[0-9]'));
  static final numbersAndSpaceFormatter = FilteringTextInputFormatter.allow(RegExp(r'[0-9\s]+'));
}