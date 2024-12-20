import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gradutionproject/core/utils/app_icons.dart';
import 'package:gradutionproject/features/on_boarding/data/on_boarding_list.dart';
import 'package:gradutionproject/features/on_boarding/presentation/viewModel/on_boarding_state.dart';
import 'package:gradutionproject/features/on_boarding/presentation/viewModel/on_boaring_cubit.dart';

class ButtonOnboarding extends StatelessWidget {
  final int index;
  const ButtonOnboarding({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<OnBoardingCubit>(context);
    return BlocBuilder<OnBoardingCubit, OnBoardingState>(
      builder: (context, state) {
        return TweenAnimationBuilder(
          tween: cubit.reverseButtonOnBoarding ? Tween<double>(
              begin: 1, end: 1.15) :
          Tween<double>(begin: 1.15, end: 1),
          duration: const Duration(seconds: 1),
          onEnd: () {
            cubit.toggleReverseButton();
          },
          child: InkWell(
              onTap: () =>  index != onBoardingList.length-1?
               cubit.nextPage() : cubit.previousPage()
              ,
              child: SvgPicture.asset(AppIcons.iconOnBoarding)),
          builder: (BuildContext context, value, Widget? child) {
            return Transform.scale(
              scale: value,
              child: child,
            );
          },
        );
      },
    );
  }
}
