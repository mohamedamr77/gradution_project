import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradutionproject/features/on_boarding/presentation/viewModel/on_boarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit() : super(OnBoardingInitialState());

  bool reverseImageInBoarding = false;
  bool reverseButtonOnBoarding = false;

  void toggleReverseImage() {
    reverseImageInBoarding = !reverseImageInBoarding;
    emit(OnBoardingImageChangeState());
  }

  void toggleReverseButton() {
    reverseButtonOnBoarding = !reverseButtonOnBoarding;
    emit(OnBoardingButtonAnimationState());
  }

}