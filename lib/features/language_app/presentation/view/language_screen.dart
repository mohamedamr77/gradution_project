import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradutionproject/features/language_app/presentation/view/widgets/language_body.dart';
import 'package:gradutionproject/features/language_app/presentation/viewModel/language_app_cubit.dart';

import '../../../../core/navigation/navigation_manager.dart';
import '../../../../core/shared_widget/custom_app_bar.dart';
import '../../../../core/utils/app_text.dart';

class LanguageScreen extends StatelessWidget {
  static String id = "language_screen";

  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LanguageAppCubit(),
      child: Scaffold(
        appBar: CustomAppBar(
          title: AppText.language,
          onBackPressed: () {
            NavigationManager.goBack();
          },
        ),
        body: const LanguageBody(),
      ),
    );
  }
}
