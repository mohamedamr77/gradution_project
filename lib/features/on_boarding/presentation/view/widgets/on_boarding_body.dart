import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradutionproject/core/shared_widget/custom_elevated_btn.dart';
import 'package:gradutionproject/core/shared_widget/global_text.dart';
import 'package:gradutionproject/core/utils/app_colors.dart';
import 'package:gradutionproject/core/utils/app_icons.dart';
import 'package:gradutionproject/core/utils/app_images.dart';
import 'package:gradutionproject/core/utils/app_text.dart';
import 'package:gradutionproject/core/utils/extentions/screen_size.dart';
import 'package:gradutionproject/features/on_boarding/data/model/on_boarding_model.dart';
import 'package:gradutionproject/features/on_boarding/data/on_boarding_list.dart';
import 'package:gradutionproject/features/on_boarding/presentation/view/widgets/title_on_boarding.dart';
import 'package:gradutionproject/features/on_boarding/presentation/viewModel/on_boaring_cubit.dart';
import 'button_onboarding.dart';
import 'image_on_boarding.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
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
          children: [
            0.03.ph,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_back_ios,
                      color: AppColors.primaryColor, size: 24),
                ),
                const GText(
                    color: AppColors.primaryColor,
                    content: AppText.continueText,
                    fontSize: 18),
              ],
            ),
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
            SmoothPageIndicator(
                controller: BlocProvider.of<OnBoardingCubit>(context).pageControllerPageView,  // PageController
                count:  onBoardingList.length,
                effect:  const SwapEffect(), // your preferred effect
                onDotClicked: (index){
                }
            )
          ],
        ),
      ),
    );
  }
}