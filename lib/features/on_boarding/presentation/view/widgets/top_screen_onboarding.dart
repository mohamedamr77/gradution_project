import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradutionproject/core/navigation/navigation_manager.dart';
import 'package:gradutionproject/core/shared_widget/global_text.dart';
import 'package:gradutionproject/features/auth/login/presentation/view/login_screen.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text.dart';
import '../../../data/on_boarding_list.dart';
import '../../viewModel/on_boaring_cubit.dart';

class TopScreenOnboarding extends StatelessWidget {
  final int index;

  const TopScreenOnboarding({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<OnBoardingCubit>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildBackButton(cubit),
        _buildContinueText(),
      ],
    );
  }

  Widget _buildBackButton(OnBoardingCubit cubit) {
    return Visibility(
      visible: index > 0,
      child: InkWell(
        onTap: cubit.previousPage,
        child: const Icon(
          Icons.arrow_back_ios,
          color: AppColors.primaryColor,
          size: 24,
        ),
      ),
    );
  }

  Widget _buildContinueText() {
    return Visibility(
      visible: index != onBoardingList.length - 1,
      child: InkWell(
        onTap: () => NavigationManager.replaceAll(LoginScreen.id),
        child: const GText(
          color: AppColors.primaryColor,
          content: AppText.continueText,
          fontSize: 18,
        ),
      ),
    );
  }
}
