import 'package:bloc/bloc.dart';

import 'enter_otp_state.dart';

class EnterOtpCubit extends Cubit<EnterOTPState> {
  EnterOtpCubit() : super(EnterOtpInitialState());

  // OTPTextModel otpTextModel = OTPTextModel();
}
