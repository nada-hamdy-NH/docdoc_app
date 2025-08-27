class PaymentIntentInputModel {
  final int amount;
  final String currency;
  PaymentIntentInputModel({required this.amount, required this.currency});
  toJson() {
    return {'amount': amount, 'currency': currency};
  }
}
