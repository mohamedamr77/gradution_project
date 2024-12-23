import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradutionproject/features/forget_password/presentation/view/widgets/change_pass_body.dart';

import '../view_model/change_pass_cubit/change_pass_cubit.dart';

class ChangePasswordScreen extends StatelessWidget {
  static const String id = "change-password";

  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChangePassCubit(),
      child: Scaffold(
        body: ChangePassBody(),
      ),
    );
  }
}
