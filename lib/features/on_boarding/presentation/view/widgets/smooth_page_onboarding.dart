import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../data/on_boarding_list.dart';
import '../../viewModel/on_boaring_cubit.dart';

class SmoothPageOnboarding extends StatelessWidget {
  final int index;
  const SmoothPageOnboarding({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<OnBoardingCubit>(context);

    return Visibility(
      visible: index != onBoardingList.length - 1,
      child: Align(
        alignment: Alignment.center,
        child: SmoothPageIndicator(
            controller: cubit.pageControllerPageView, // PageController
            count: onBoardingList.length,
            effect: const SwapEffect(), // your preferred effect
            onDotClicked: (index) {}),
      ),
    );
  }
}
