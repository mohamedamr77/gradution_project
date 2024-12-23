import 'package:flutter/material.dart';
import 'package:gradutionproject/features/forget_password/presentation/view/widgets/forget_pass_body.dart';

class ForgetPassScreen extends StatelessWidget {

  static const String id ="ForgetPassScreenId";
  const ForgetPassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body:ForgetPassBody(),
    );
  }
}
