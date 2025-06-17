import 'package:docdoc/core/helper/constants.dart';
import 'package:docdoc/core/helper/shared_preference.dart';
import 'package:docdoc/core/networking/dio_factory.dart';
import 'package:docdoc/features/login/data/models/login_request_body.dart';
import 'package:docdoc/features/login/data/repos/login_repo.dart';
import 'package:docdoc/features/login/logic/login_state.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo loginRepo;
  LoginCubit(this.loginRepo) : super(const LoginState.initial());

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
final formKey = GlobalKey<FormState>();

  void emitLoginState() async {
    emit(const LoginState.loading());
    final response = await loginRepo.login(LoginRequestBody(
      email: emailController.text,
      password: passwordController.text));
    response.when(success: (LoginResponse)async {
       await saveUserToken(LoginResponse.userData?.token ?? "");
      emit(LoginState.success(LoginResponse));
    }, failure: (error) {
      emit(LoginState.error(error: error.apiErrorModel.message ?? ""));
    });
  }
}

Future<void> saveUserToken(String token) async {
  await SharedPrefHelper.setSecuredStorage(ConstantsPrfKeys.userToken, token);
   DioFactory.setTokenIntoHeaderAfterLogin(token);
}
