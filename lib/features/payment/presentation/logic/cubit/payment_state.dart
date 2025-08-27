part of 'payment_cubit.dart';

@freezed
class PaymentState with _$PaymentState {
  const factory PaymentState.initial() = _Initial;
  const factory PaymentState.paymentLoading() = _PaymentLoading;
  const factory PaymentState.paymentSuccess() = _PaymentSuccess;
  const factory PaymentState.paymentFailed(ApiErrorModel apiErrorModel) =
      _PaymentFailed;
}
