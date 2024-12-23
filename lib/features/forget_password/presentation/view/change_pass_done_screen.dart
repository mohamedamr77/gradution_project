import 'package:flutter/material.dart';
import 'package:gradutionproject/features/forget_password/presentation/view/widgets/change_pass_done_body.dart';

class ChangePassDoneScreen extends StatelessWidget {
  static const String id = "ChangePassDoneScreen";
  const ChangePassDoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ChangePassDoneBody(),
    );
  }
}
