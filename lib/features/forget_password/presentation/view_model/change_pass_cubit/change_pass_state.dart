import 'package:gradutionproject/features/forget_password/data/model/forget_password/forget_password_response.dart';

abstract class ChangePassState {}

class ChangePassInitialState extends ChangePassState {}

class ForgetPasswordLoadingState extends ChangePassState {}

class ForgetPasswordFaliureState extends ChangePassState {
  final String errorMessage;
  ForgetPasswordFaliureState({required this.errorMessage});
}

class ForgetPasswordSuccessState extends ChangePassState {
  final ForgetPasswordResponse forgetPasswordResponse;

  ForgetPasswordSuccessState({required this.forgetPasswordResponse});
}

class ConfirmResetPasswordLoadingState extends ChangePassState {}

class ConfirmResetPasswordFaliureState extends ChangePassState {
  final String errorMessage;

  ConfirmResetPasswordFaliureState({required this.errorMessage});
}

class ConfirmResetPasswordSuccessState extends ChangePassState {
  final String message;

  ConfirmResetPasswordSuccessState({required this.message});
}
