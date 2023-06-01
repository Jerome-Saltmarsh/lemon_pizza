
import 'package:flutter/services.dart';

final numbersOnlyFormatter = FilteringTextInputFormatter.allow(RegExp(r'[0-9]'));
final numbersAndSpaceFormatter = FilteringTextInputFormatter.allow(RegExp(r'[0-9\s]+'));