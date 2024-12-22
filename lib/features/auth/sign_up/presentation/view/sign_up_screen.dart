import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradutionproject/features/auth/sign_up/presentation/view/widgets/sign_up_body.dart';

import '../viewModel/sign_up_cubit.dart';

class SignUpScreen extends StatelessWidget {
  static const String id = "SignUpScreen";

  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(),
      child: const Scaffold(
        body: SignUpBody(),
      ),
    );
  }
}
