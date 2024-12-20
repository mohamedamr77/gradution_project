import 'package:flutter/material.dart';
import '../../features/auth/login/presentation/view/login_screen.dart';
import '../../features/auth/sign_up/presentation/view/sign_up_screen.dart';
import '../../features/on_boarding/presentation/view/on_boarding_screen.dart';


class AppRouter {
  static Map<String, Widget Function(dynamic)> routes = {
    OnBoardingScreen.id: (context) => const OnBoardingScreen(),
    SignUpScreen.id: (context) => const SignUpScreen(),
    LoginScreen.id: (context) => const LoginScreen(),

  };
}
