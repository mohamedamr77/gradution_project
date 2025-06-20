import 'package:gradutionproject/features/auth/sign_up/data/model/auth_response.dart';

abstract class SignUpState {}

class SignUpInitialState extends SignUpState {}

class VisibilityPasswordChange extends SignUpState {}

class VisibilityConfirmPasswordChange extends SignUpState {}
class SignUpWithEmailLoadingState extends SignUpState {}
class SignUpWithEmailSuccessState extends SignUpState {
  final AuthResponse  authResponse;

  SignUpWithEmailSuccessState({required this.authResponse});
}
class SignUpWithEmailFailureState extends SignUpState {
  final String error;

  SignUpWithEmailFailureState({required this.error});
}