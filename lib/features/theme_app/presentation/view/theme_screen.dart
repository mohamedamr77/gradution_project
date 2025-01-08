import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradutionproject/features/theme_app/presentation/view/widgets/theme_body.dart';

import '../../../../core/shared_widget/custom_app_bar.dart';
import '../../../../core/utils/app_text.dart';
import '../viewModel/theme_cubit.dart';

class ThemeScreen extends StatelessWidget {
  static String id = "ThemeScreen";

  const ThemeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit(),
      child: const Scaffold(
        appBar: CustomAppBar(
          title: AppText.themes,
        ),
        body: ThemeBody(),

      ),
    );
  }
}
