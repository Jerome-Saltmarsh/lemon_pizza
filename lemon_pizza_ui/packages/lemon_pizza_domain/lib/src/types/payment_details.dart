
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
    this.cardNumber = '',
    this.expiryYear = '',
    this.expiryMonth = '',
    this.cvv = '',
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
    bool clearCardNumberError = false,
    bool clearExpiryYearError = false,
    bool clearExpiryMonthError = false,
    bool clearCvvError = false,
  }) =>
    PaymentDetails(
      cardNumber: cardNumber ?? this.cardNumber,
      expiryYear: expiryYear ?? this.expiryYear,
      expiryMonth: expiryMonth ?? this.expiryMonth,
      cvv: cvv ?? this.cvv,
      cardNumberError: cardNumberError ?? (clearCardNumberError ? null : this.cardNumberError),
      expiryYearError: expiryYearError ?? (clearExpiryYearError ? null : this.expiryYearError),
      expiryMonthError: expiryMonthError ?? (clearExpiryMonthError ? null : this.expiryMonthError),
      cvvError: cvvError ?? (clearCvvError ? null : this.cvvError),
    );
}

