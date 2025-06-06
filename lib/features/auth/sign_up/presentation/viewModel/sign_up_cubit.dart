import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradutionproject/features/auth/sign_up/data/model/sign_up_request.dart';
import 'package:gradutionproject/features/auth/sign_up/data/repo/sign_up_repo.dart';
import 'package:gradutionproject/features/auth/sign_up/presentation/viewModel/sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit({required this.signUpRepo}) : super(SignUpInitialState());

  bool visibilityPassword = true;
  bool visibilityConfirmPassword = true;
  final SignUpRepo signUpRepo;

  String? name;
  String? email;
  String? password;
  String? phoneNumber;

  toggleVisibilityPassword() {
    visibilityPassword = !visibilityPassword;
    emit(VisibilityPasswordChange());
  }

  toggleVisibilityConfirmPassword() {
    visibilityConfirmPassword = !visibilityConfirmPassword;
    emit(VisibilityConfirmPasswordChange());
  }

  void resetState() {
    visibilityPassword = true;
    visibilityConfirmPassword = true;
    name = null;
    email = null;
    password = null;
    phoneNumber = null;
    emit(SignUpInitialState());
  }

  Future<void> signUpWithEmail() async {
    debugPrint("Name: $name, Email: $email, Password: $password, Phone: $phoneNumber");
    emit(SignUpWithEmailLoadingState());
    final result = await signUpRepo.userRegister(
        registerRequest: RegisterRequest(
          firstName: name,
          lastName: name,
          email: email,
          password: password,
          phoneNumber: phoneNumber,
        )
    );
   result.fold((l) {
      emit(SignUpWithEmailFailureState(error: l.message));
   }, (r) {
      emit(SignUpWithEmailSuccessState(signUpResponse: r));
   },);
  }
}
