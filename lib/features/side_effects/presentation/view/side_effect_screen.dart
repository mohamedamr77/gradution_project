import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gradutionproject/features/side_effects/presentation/view/widgets/side_effect_body.dart';
import 'package:gradutionproject/features/side_effects/presentation/view_model/side_effects_cubit.dart';

import '../../../../core/navigation/navigation_manager.dart';
import '../../../../core/shared_widget/custom_app_bar.dart';
import '../../../../core/utils/app_icons.dart';
import '../../../../core/utils/app_text.dart';

class SideEffectScreen extends StatelessWidget {
  static String id = 'side_effect_screen';
  const SideEffectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SideEffectsCubit(),
      child: Scaffold(
        appBar: CustomAppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: SvgPicture.asset(AppIcons.search),
            )
          ],
          title: AppText.articlesSideEffects,
          onBackPressed: () {
            NavigationManager.goBack();
          },
        ),
        body: const SideEffectBody(),
      ),
    );
  }
}
