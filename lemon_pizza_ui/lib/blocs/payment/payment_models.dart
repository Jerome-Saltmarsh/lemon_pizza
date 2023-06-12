import 'package:formz/formz.dart';

enum CardNumberValidationError { required, tooShort, tooLong, invalid }

class CardNumber extends FormzInput<String, CardNumberValidationError> {
  const CardNumber.pure([super.value = '']) : super.pure();
  const CardNumber.dirty([super.value = '']) : super.dirty();

  @override
  CardNumberValidationError? validator(String? value) {
    if (value == null) return CardNumberValidationError.required;
    if (value.length < 16) return CardNumberValidationError.tooShort;
    if (value.length > 20) return CardNumberValidationError.tooLong;
    if (int.tryParse(value) == null) return CardNumberValidationError.invalid;
    return null;
  }
}
