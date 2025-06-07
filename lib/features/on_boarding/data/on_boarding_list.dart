import 'package:gradutionproject/core/utils/locale_keys.g.dart';
import 'package:gradutionproject/features/on_boarding/data/model/on_boarding_model.dart';

import '../../../core/utils/app_images.dart';

List<OnboardingModel> onBoardingList = [
  OnboardingModel(
      title: LocaleKeys.startJourney, imagePath: AppImages.onboardingScreen1),
  OnboardingModel(
      title: LocaleKeys.sideEffectsInfo, imagePath: AppImages.onboardingScreen2),
  OnboardingModel(
      title: LocaleKeys.safeMedicines, imagePath: AppImages.onboardingScreen3),
];
