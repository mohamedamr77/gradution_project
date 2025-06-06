import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradutionproject/features/auth/sign_up/data/model/sign_up_request.dart';
import 'package:gradutionproject/features/auth/sign_up/data/repo/sign_up_repo.dart';
import 'package:gradutionproject/features/auth/sign_up/presentation/viewModel/sign_up_state.dart';
import '../../../../../core/utils/token_manager.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit({required this.signUpRepo}) : super(SignUpInitialState());

  bool visibilityPassword = true;
  bool visibilityConfirmPassword = true;
  final SignUpRepo signUpRepo;

  String? firstName;
  String? secondName;
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
    firstName = null;
    secondName = null;
    email = null;
    password = null;
    phoneNumber = null;
    emit(SignUpInitialState());
  }

  Future<void> signUpWithEmail() async {
    emit(SignUpWithEmailLoadingState());
    final result = await signUpRepo.userRegister(
        registerRequest: RegisterRequest(
          firstName: firstName,
          lastName:secondName,
          email: email,
          password: password,
          phoneNumber: phoneNumber,
        )
    );
   result.fold((l) {
      emit(SignUpWithEmailFailureState(error: l.message));
   }, (r) {
     TokenManager.saveToken(r.token??"");
      emit(SignUpWithEmailSuccessState(authResponse: r));
   },);
  }
}
