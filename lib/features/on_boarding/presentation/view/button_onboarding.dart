import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gradutionproject/core/utils/app_icons.dart';

class ButtonOnboarding extends StatefulWidget {
  const ButtonOnboarding({super.key});

  @override
  State<ButtonOnboarding> createState() => _ButtonOnboardingState();
}

class _ButtonOnboardingState extends State<ButtonOnboarding> {

  bool reverse = false;
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
        tween: reverse ? Tween<double>(begin: 1 , end: 1.1) :
        Tween<double>(begin: 1.1 , end: 1),
        duration: const Duration(seconds: 1),
        onEnd: (){
          setState(() {
            reverse = !reverse;
          });
        },
        child:  SvgPicture.asset(AppIcons.iconOnBoarding),
        builder: (BuildContext context,  value, Widget? child) {
          return Transform.scale(
            scale: value,
            child: child,
          );
        },
    );
  }
}
