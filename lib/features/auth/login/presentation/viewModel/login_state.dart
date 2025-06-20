import 'package:gradutionproject/features/auth/sign_up/data/model/auth_response.dart';

abstract class LoginState {}

class LoginInitialState extends LoginState {}

class PasswordVisibilityChangedState extends LoginState {}

class RiveFileLoadedState extends LoginState {}

class RiveFileLoadErrorState extends LoginState {}

class CheckingLoginState extends LoginState {}

class LoginWithEmailLoadingState extends LoginState {}
class LoginWithSuccessState extends LoginState {
  final AuthResponse  authResponse;

  LoginWithSuccessState({required this.authResponse});
}

class LoginFailState extends LoginState {
  final String error;

  LoginFailState({required this.error});
}

class HandUpState extends LoginState {}

class HandDownState extends LoginState {}
