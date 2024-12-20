import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradutionproject/features/auth/sign_up/presentation/viewModel/sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitialState());

  bool visibilityPassword = true;
  bool visibilityConfirmPassword = true;

  toggleVisibilityPassword(){
    visibilityPassword = !visibilityPassword;
    emit(VisibilityPasswordChange());
  }

  toggleVisibilityConfirmPassword(){
    visibilityConfirmPassword = !visibilityConfirmPassword;
    emit(VisibilityConfirmPasswordChange());
  }
}
