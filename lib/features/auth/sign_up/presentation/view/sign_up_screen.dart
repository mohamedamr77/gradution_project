import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradutionproject/core/helper/api_service.dart';
import 'package:gradutionproject/core/utils/app_colors.dart';
import 'package:gradutionproject/features/auth/sign_up/data/repo/sign_up_repo_imple.dart';
import 'package:gradutionproject/features/auth/sign_up/presentation/view/widgets/sign_up_body.dart';
import 'package:gradutionproject/features/auth/sign_up/presentation/viewModel/sign_up_state.dart';

import '../viewModel/sign_up_cubit.dart';

class SignUpScreen extends StatelessWidget {
  static const String id = "SignUpScreen";

  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(signUpRepo: SignUpRepoImpl(apiService: ApiService())),
      child:  Stack(
        children: [
          const Scaffold(
            body: SignUpBody(),
          ),
          BlocBuilder<SignUpCubit,SignUpState>(
            builder: (context, state) {
              if (state is SignUpWithEmailLoadingState) {
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
