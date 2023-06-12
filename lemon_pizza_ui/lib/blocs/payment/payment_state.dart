import 'package:formz/formz.dart';

import 'payment_models.dart';

class PaymentState {
  final FormzSubmissionStatus? status;
  final CardNumber cardNumber;
  final String expiryYear;
  final String expiryMonth;
  final String cvv;

  PaymentState({
    required this.status,
    required this.cardNumber,
    required this.expiryYear,
    required this.expiryMonth,
    required this.cvv,
  });

  PaymentState copyWith({
        FormzSubmissionStatus? status,
        CardNumber? cardNumber,
        String? expiryYear,
        String? expiryMonth,
        String? cvv,
  }) => PaymentState(
        status: status ?? this.status,
        cardNumber: cardNumber ?? this.cardNumber,
        expiryYear: expiryYear ?? this.expiryYear,
        expiryMonth: expiryMonth ?? this.expiryMonth,
        cvv: cvv ?? this.cvv,
    );
}