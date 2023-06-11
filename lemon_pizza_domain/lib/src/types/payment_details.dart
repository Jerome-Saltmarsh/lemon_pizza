
class PaymentDetails {
  final String cardNumber;
  final String expiryYear;
  final String expiryMonth;
  final String cvv;

  PaymentDetails({
    required this.cardNumber,
    required this.expiryYear,
    required this.expiryMonth,
    required this.cvv,
  });

  PaymentDetails copyWith({
    String? cardNumber,
    String? expiryYear,
    String? expiryMonth,
    String? cvv,
  }) =>
    PaymentDetails(
      cardNumber: cardNumber ?? this.cardNumber,
      expiryYear: expiryYear ?? this.expiryYear,
      expiryMonth: expiryMonth ?? this.expiryMonth,
      cvv: cvv ?? this.cvv,
    );
}

