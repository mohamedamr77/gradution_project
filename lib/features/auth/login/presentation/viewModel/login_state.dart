abstract class LoginState {}

class LoginInitialState extends LoginState {}

class PasswordVisibilityChangedState extends LoginState {}

class RiveFileLoadedState extends LoginState {}

class RiveFileLoadErrorState extends LoginState {}

class CheckingLoginState extends LoginState {}

class LoginSuccessState extends LoginState {}

class LoginFailState extends LoginState {}

class HandUpState extends LoginState {}

class HandDownState extends LoginState {}
