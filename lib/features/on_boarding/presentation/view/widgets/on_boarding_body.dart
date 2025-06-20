import 'package:easy_localization/easy_localization.dart';
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
  const OnBoardingBody(
      {super.key, required this.onboardingModel, required this.index});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.06.w),
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    0.03.ph,
                    TopScreenOnboarding(
                      index: index,
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    ImageOnBoarding(
                      imagePath: onboardingModel.imagePath,
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    TitleOnBoarding(
                      title: onboardingModel.title.tr(),
                    ),
                    const Spacer(
                      flex: 2,
                    ),
                    ButtonOnboarding(
                      index: index,
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    SmoothPageOnboarding(
                      index: index,
                    ),
                    StartText(
                      index: index,
                    ),
                    const Spacer(
                      flex: 3,
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
