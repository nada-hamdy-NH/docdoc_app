import 'package:bloc/bloc.dart';
import 'package:docdoc/core/networking/api_error_model.dart';
import 'package:docdoc/features/payment/data/payment_intent_inout_model.dart';
import 'package:docdoc/features/payment/data/payment_intent_response_model/payment_intent_model.dart';
import 'package:docdoc/features/payment/data/repos/payment_repo_imp.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_state.dart';
part 'payment_cubit.freezed.dart';

class PaymentCubit extends Cubit<PaymentState> {
  final PaymentRepoImp paymentRepoIpm;
  PaymentCubit(this.paymentRepoIpm) : super(PaymentState.initial());

  Future<void> makePayment(
      PaymentIntentInputModel paymentIntentInoutModel) async {
    emit(PaymentState.paymentLoading());
    var result = await paymentRepoIpm.makePayment(
        paymentIntentInputModel: paymentIntentInoutModel);
    result.when(success: (PaymentIntentModel) {
      emit(const PaymentState.paymentSuccess());
    }, failure: (ApiErrorModel) {
      emit(PaymentState.paymentFailed(ApiErrorModel));
    });
  }
}
