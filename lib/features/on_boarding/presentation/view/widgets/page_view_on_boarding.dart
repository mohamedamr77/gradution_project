import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradutionproject/features/on_boarding/presentation/view/widgets/on_boarding_body.dart';

import '../../../data/on_boarding_list.dart';
import '../../viewModel/on_boaring_cubit.dart';

class PageViewOnBoarding extends StatelessWidget {
  const PageViewOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return  PageView.builder(
      controller: BlocProvider.of<OnBoardingCubit>(context).pageControllerPageView,
      itemBuilder: (BuildContext context, int index) {
        return OnBoardingBody(
          index: index,
          onboardingModel: onBoardingList[index],
        );
      },
      onPageChanged: (value) {
        BlocProvider.of<OnBoardingCubit>(context).changeIndexPageView(value);
      },
      itemCount: onBoardingList.length,
    );
  }
}
