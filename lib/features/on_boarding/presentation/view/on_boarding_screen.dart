import 'package:flutter/material.dart';
import 'package:gradutionproject/features/on_boarding/presentation/view/on_boarding_body.dart';

class OnBoardingScreen extends StatelessWidget {
  static const String id ="/";
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: OnBoardingBody(),
    );
  }
}
