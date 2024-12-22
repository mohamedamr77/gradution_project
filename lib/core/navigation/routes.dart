import 'package:flutter/material.dart';
import '../../features/auth/login/presentation/view/login_screen.dart';
import '../../features/auth/sign_up/presentation/view/sign_up_screen.dart';
import '../../features/forget_password/presentation/view/change_pass_done_screen.dart';
import '../../features/forget_password/presentation/view/change_pass_screen.dart';
import '../../features/forget_password/presentation/view/forget_pass_screen.dart';
import '../../features/forget_password/presentation/view/verify_code_screen.dart';
import '../../features/on_boarding/presentation/view/on_boarding_screen.dart';


class AppRouter {
  static Map<String, Widget Function(dynamic)> routes = {
    OnBoardingScreen.id: (context) => const OnBoardingScreen(),
    SignUpScreen.id: (context) => const SignUpScreen(),
    LoginScreen.id: (context) => const LoginScreen(),
    ForgetPassScreen.id: (context) => const ForgetPassScreen(),
    VerifyCodeScreen.id: (context) => const VerifyCodeScreen(),
    ChangePasswordScreen.id: (context) => const ChangePasswordScreen(),
    ChangePassDoneScreen.id: (context) => const ChangePassDoneScreen(),

  };
}
