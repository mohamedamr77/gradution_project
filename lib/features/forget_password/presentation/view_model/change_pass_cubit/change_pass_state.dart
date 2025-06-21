import 'package:gradutionproject/features/forget_password/data/model/forget_password/forget_password_response.dart';

abstract class ChangePassState {}

class ChangePassInitialState extends ChangePassState {}

class ForgetPasswordLoadingState extends ChangePassState {}

class ForgetPasswordFaliureState extends ChangePassState {}

class ForgetPasswordSuccessState extends ChangePassState {
  final ForgetPasswordResponse forgetPasswordResponse;

  ForgetPasswordSuccessState({required this.forgetPasswordResponse});
}

class ConfirmResetPasswordLoadingState extends ChangePassState {}
