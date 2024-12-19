import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradutionproject/core/utils/extentions/screen_size.dart';

import '../../viewModel/on_boarding_state.dart';
import '../../viewModel/on_boaring_cubit.dart';

class ImageOnBoarding extends StatelessWidget {
  final String imagePath;

  const ImageOnBoarding({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<OnBoardingCubit>(context);
    return BlocBuilder<OnBoardingCubit, OnBoardingState>(
      builder: (context, state) {
        return TweenAnimationBuilder(
          tween:
          cubit.reverseImageInBoarding ?
          Tween<double>(begin: 0.95, end: 1) :
          Tween<double>(begin: 1, end: 0.95),
          duration: const Duration(seconds: 1),
          onEnd: () {
            cubit.toggleReverseImage();
          },
          child: Image(
            image: AssetImage(
              imagePath,
            ),
            width: double.infinity,
            height: 0.34.h,
            fit: BoxFit.fill,
          ),
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