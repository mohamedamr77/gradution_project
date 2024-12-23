import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradutionproject/features/auth/login/presentation/viewModel/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());
  bool visibilityPassword = true;
  toggleVisibilityPassword(){
    visibilityPassword = !visibilityPassword;
    emit(VisibilityPasswordChange());
  }

}
