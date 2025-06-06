import 'package:gradutionproject/features/auth/sign_up/data/model/sign_up_response.dart';

abstract class SignUpState {}

class SignUpInitialState extends SignUpState {}

class VisibilityPasswordChange extends SignUpState {}

class VisibilityConfirmPasswordChange extends SignUpState {}
class SignUpWithEmailLoadingState extends SignUpState {}
class SignUpWithEmailSuccessState extends SignUpState {
  final SignUpResponse signUpResponse;

  SignUpWithEmailSuccessState({required this.signUpResponse});
}
class SignUpWithEmailFailureState extends SignUpState {
  final String error;

  SignUpWithEmailFailureState({required this.error});
}