import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradutionproject/core/utils/extentions/screen_size.dart';

import '../../viewModel/on_boarding_state.dart';
import '../../viewModel/on_boaring_cubit.dart';

class ImageOnBoarding extends StatefulWidget {
  final String imagePath;

  const ImageOnBoarding({super.key, required this.imagePath});

  @override
  State<ImageOnBoarding> createState() => _ImageOnBoardingState();
}

class _ImageOnBoardingState extends State<ImageOnBoarding> with SingleTickerProviderStateMixin{

  late Animation<double> _opacityAnimation;
  late AnimationController _controller;

  @override
  void initState(){
     super.initState();
     _controller =  AnimationController(vsync: this,duration: Duration(seconds: 1));
      _opacityAnimation = Tween<double>(
        begin: 0.4,
        end: 1,
      ).animate(_controller);
     _controller.forward();

  }
  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<OnBoardingCubit>(context);
    return BlocBuilder<OnBoardingCubit, OnBoardingState>(
      builder: (context, state) {
        return AnimatedBuilder(
          animation: _opacityAnimation,
          builder: (BuildContext context, Widget? child) {
            return Opacity(
              opacity: _controller.value,
              child: TweenAnimationBuilder(
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
                    widget.imagePath,
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

              ),
            );
          },

        );
      },
    );
  }
}