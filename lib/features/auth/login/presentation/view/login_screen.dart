import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradutionproject/features/auth/login/presentation/view/widgets/login_body.dart';
import 'package:gradutionproject/features/auth/login/presentation/viewModel/login_cubit.dart';

class LoginScreen extends StatelessWidget {
  static const String id = "login_screen";

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Scaffold(
        body: LoginBody(),
      ),
    );
  }
}
