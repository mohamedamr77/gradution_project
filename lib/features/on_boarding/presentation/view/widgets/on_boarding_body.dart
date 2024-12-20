import 'package:flutter/material.dart';
import 'package:gradutionproject/core/utils/extentions/screen_size.dart';
import 'package:gradutionproject/features/on_boarding/data/model/on_boarding_model.dart';
import 'package:gradutionproject/features/on_boarding/presentation/view/widgets/smooth_page_onboarding.dart';
import 'package:gradutionproject/features/on_boarding/presentation/view/widgets/start_text.dart';
import 'package:gradutionproject/features/on_boarding/presentation/view/widgets/title_on_boarding.dart';
import 'package:gradutionproject/features/on_boarding/presentation/view/widgets/top_screen_onboarding.dart';
import 'button_onboarding.dart';
import 'image_on_boarding.dart';

class OnBoardingBody extends StatelessWidget {

  final OnboardingModel onboardingModel;
  final int index;
  const OnBoardingBody({super.key, required this.onboardingModel, required this.index});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 0.06.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            0.03.ph,
            TopScreenOnboarding(index: index,),
            const SizedBox(
              height: 38,
            ),
              ImageOnBoarding(imagePath: onboardingModel.imagePath ,),
            const SizedBox(
              height: 38,
            ),
             TitleOnBoarding(title: onboardingModel.title,),
            const SizedBox(
              height: 48,
            ),
            const ButtonOnboarding(),
            const SizedBox(
              height: 12,
            ),
            SmoothPageOnboarding(index: index,),
            StartText(index: index,),

          ],
        ),
      ),
    );
  }
}