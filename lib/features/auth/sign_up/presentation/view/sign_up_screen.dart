import 'package:flutter/material.dart';
import 'package:gradutionproject/features/auth/sign_up/presentation/view/widgets/sign_up_body.dart';

class SignUpScreen extends StatelessWidget {
  static const String id ="SignUpScreen";
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SignUpBody(),
    );
  }
}
