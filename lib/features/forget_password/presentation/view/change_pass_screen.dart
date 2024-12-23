import 'package:flutter/material.dart';
import 'package:gradutionproject/features/forget_password/presentation/view/widgets/change_pass_body.dart';

class ChangePasswordScreen extends StatelessWidget {
  static const String id = "change-password";
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: ChangePassBody(),
    );
  }
}
