import 'package:flutter/material.dart';
import 'package:gradutionproject/features/forget_password/presentation/view/widgets/verify_code_body.dart';

class VerifyCodeScreen extends StatelessWidget {
  static const String id = "verify_code_screen";

  const VerifyCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: VerifyCodeBody(),
    );
  }
}
