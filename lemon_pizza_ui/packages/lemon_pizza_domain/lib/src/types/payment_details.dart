
class PaymentDetails {
  final String cardNumber;
  final String expiryYear;
  final String expiryMonth;
  final String cvv;
  final String? cardNumberError;
  final String? expiryYearError;
  final String? expiryMonthError;
  final String? cvvError;

  PaymentDetails({
    required this.cardNumber,
    required this.expiryYear,
    required this.expiryMonth,
    required this.cvv,
    this.cardNumberError,
    this.expiryYearError,
    this.expiryMonthError,
    this.cvvError,
  });

  PaymentDetails copyWith({
    String? cardNumber,
    String? expiryYear,
    String? expiryMonth,
    String? cvv,
    String? cardNumberError,
    String? expiryYearError,
    String? expiryMonthError,
    String? cvvError,
  }) =>
    PaymentDetails(
      cardNumber: cardNumber ?? this.cardNumber,
      expiryYear: expiryYear ?? this.expiryYear,
      expiryMonth: expiryMonth ?? this.expiryMonth,
      cvv: cvv ?? this.cvv,
      cardNumberError: cardNumberError ?? this.cardNumberError,
      expiryYearError: expiryYearError ?? this.expiryYearError,
      expiryMonthError: expiryMonthError ?? this.expiryMonthError,
      cvvError: cvvError ?? this.cvvError,
    );
}

