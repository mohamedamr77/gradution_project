import 'package:gradutionproject/features/on_boarding/data/model/on_boarding_model.dart';

import '../../../core/utils/app_images.dart';
import '../../../core/utils/app_text.dart';

List<OnboardingModel> onBoardingList = [
  OnboardingModel(
      title: AppText.startJourney, imagePath: AppImages.onboardingScreen1),
  OnboardingModel(
      title: AppText.sideEffectsInfo, imagePath: AppImages.onboardingScreen2),
  OnboardingModel(
      title: AppText.safeMedicines, imagePath: AppImages.onboardingScreen3),
];
