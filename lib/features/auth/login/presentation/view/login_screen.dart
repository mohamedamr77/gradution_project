import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradutionproject/core/helper/api_service.dart';
import 'package:gradutionproject/features/auth/login/data/repo/login_repo_impl.dart';
import 'package:gradutionproject/features/auth/login/presentation/view/widgets/login_body.dart';
import 'package:gradutionproject/features/auth/login/presentation/viewModel/login_cubit.dart';
import 'package:gradutionproject/features/auth/login/presentation/viewModel/login_state.dart';

import '../../../../../core/utils/app_colors.dart';

class LoginScreen extends StatelessWidget {
  static const String id = "login_screen";

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(loginRepo: LoginRepoImpl(apiService: ApiService())),
      child:  Stack(
        children: [
          const Scaffold(
            body: LoginBody(),
          ),
          BlocBuilder<LoginCubit,LoginState>(
            builder: (context, state) {
              if (state is LoginWithEmailLoadingState) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.black12,
                  child: const CircularProgressIndicator(
                    color:  AppColors.primaryColor,
                  ),
                );
              }else {
                return const SizedBox();
              }
            },)
        ],
      ),
    );
  }
}
