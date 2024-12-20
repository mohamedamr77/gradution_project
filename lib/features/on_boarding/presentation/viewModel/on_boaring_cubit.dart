import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradutionproject/features/on_boarding/presentation/viewModel/on_boarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit() : super(OnBoardingInitialState());

  bool reverseImageInBoarding = false;
  bool reverseButtonOnBoarding = false;
  int indexPageView = 0;
  PageController pageControllerPageView = PageController();

  void changeIndexPageView(int index) {
    indexPageView = index;
    debugPrint('indexPageView: $indexPageView');
    emit(OnBoardingPageViewChangeState());
  }

  void toggleReverseImage() {
    reverseImageInBoarding = !reverseImageInBoarding;
    emit(OnBoardingImageChangeState());
  }

  void toggleReverseButton() {
    reverseButtonOnBoarding = !reverseButtonOnBoarding;
    emit(OnBoardingButtonAnimationState());
  }

  void  previousPage(){
    pageControllerPageView.previousPage(duration: Duration(milliseconds: 500), curve: Curves.easeOut);
  }

}