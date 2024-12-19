import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradutionproject/features/on_boarding/presentation/view/widgets/on_boarding_body.dart';
import 'package:gradutionproject/features/on_boarding/presentation/viewModel/on_boaring_cubit.dart';

class OnBoardingScreen extends StatelessWidget {
  static const String id = "/";

  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnBoardingCubit(),
      child: Scaffold(
        body: OnBoardingBody(),
      ),
    );
  }
}
