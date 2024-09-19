import 'package:docdoc/features/signup/data/models/register_request_body.dart';
import 'package:docdoc/features/signup/data/repos/register_repo.dart';
import 'package:docdoc/features/signup/logic/register_state.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class RegisterCubit extends Cubit<RegisterState> {
  final RegisterRepo registerRepo;
  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  RegisterCubit(this.registerRepo) : super(const RegisterState.initial());
  void emitRegisterState() async {
    emit(const RegisterState.loading());
    final response = await registerRepo.register(
        RegisterRequestBody(
            username: nameController.text,
            email: emailController.text,
            password: passwordController.text,
            confirmPassword: confirmPasswordController.text,
            phone: phoneController.text,
            gender:0));
  
    response.when(
        success: (RegisterResponse) {
          emit(RegisterState.succes(RegisterResponse));
        },
        failure:(error){
          emit(RegisterState.error(error: error.apiErrorModel.message ?? ""));
        }
        );
  }
}
