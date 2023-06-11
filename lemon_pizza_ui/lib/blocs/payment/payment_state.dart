

import 'package:lemon_pizza_model/lemon_pizza_model.dart';

class PaymentState {
  final PaymentStatus paymentStatus;
  final String cardNumber;
  final String expiryYear;
  final String expiryMonth;
  final String cvv;

  PaymentState({
    required this.paymentStatus,
    required this.cardNumber,
    required this.expiryYear,
    required this.expiryMonth,
    required this.cvv,
  });

  PaymentState copyWith({
        PaymentStatus? paymentStatus,
        String? cardNumber,
        String? expiryYear,
        String? expiryMonth,
        String? cvv,
  }) => PaymentState(
        paymentStatus: paymentStatus ?? this.paymentStatus,
        cardNumber: cardNumber ?? this.cardNumber,
        expiryYear: expiryYear ?? this.expiryYear,
        expiryMonth: expiryMonth ?? this.expiryMonth,
        cvv: cvv ?? this.cvv,
    );
}