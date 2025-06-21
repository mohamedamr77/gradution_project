import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradutionproject/features/forget_password/data/repo/foreget_password_repo.dart';

import 'change_pass_state.dart';

class ChangePassCubit extends Cubit<ChangePassState> {
  ChangePassCubit(this.forgetPasswordRepo) : super(ChangePassInitialState());

  String? password;
  String? confirmPassword;
  String? token;
  String? otpCode;
  final ForgetPasswordRepo forgetPasswordRepo;

  Future<void> forgotPassword({required String email}) async {
    emit(ForgetPasswordLoadingState());
    final result = await forgetPasswordRepo.forgotPassword(email: email);
    result.fold(
      (failure) {
        emit(ForgetPasswordFaliureState(errorMessage: failure.message));
      },
      (response) {
        token = response.token;
        emit(ForgetPasswordSuccessState(forgetPasswordResponse: response));
      },
    );
  }

  Future<void> confirmResetCode({
    required String code,
    required String newPassword,
  }) async {
    if (token == null) {
      emit(ConfirmResetPasswordFaliureState(errorMessage: "Token not found"));
      return;
    }

    emit(ConfirmResetPasswordLoadingState());
    final result = await forgetPasswordRepo.confirmResetCode(
      token: token!,
      code: code,
      newPassword: newPassword,
    );
    result.fold(
      (failure) {
        emit(ConfirmResetPasswordFaliureState(errorMessage: failure.message));
      },
      (message) {
        emit(ConfirmResetPasswordSuccessState(message: message));
      },
    );
  }

  void saveOtpCode(String code) {
    otpCode = code;
  }

  void saveNewPassword(String newPassword) {
    password = newPassword;
  }
}
