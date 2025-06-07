import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gradutionproject/core/shared_widget/custom_app_bar.dart';
import 'package:gradutionproject/core/utils/app_icons.dart';
import 'package:gradutionproject/features/vaccination_tips/presentation/view/widgets/vaccination_tips_body.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../core/utils/locale_keys.g.dart';

import '../viewModel/vaccination_tips_cubit.dart';

class VaccinationTipsScreen extends StatelessWidget {
  static String id = "VaccinationTipsScreen";

  const VaccinationTipsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VaccinationTipsCubit(),
      child: Scaffold(
        appBar: CustomAppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: SvgPicture.asset(AppIcons.search),
            )
          ],
          title: LocaleKeys.tipsBeforeAfterVaccination.tr(),
        ),
        body: const VaccinationTipsBody(),
      ),
    );
  }
}
