import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gradutionproject/features/vaccine_info/presentation/view/widgets/vaccine_info_body.dart';
import 'package:gradutionproject/features/vaccine_info/presentation/viewModel/vaccine_info_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../core/utils/locale_keys.g.dart';

import '../../../../core/shared_widget/custom_app_bar.dart';
import '../../../../core/utils/app_icons.dart';

class VaccineInfoScreen extends StatelessWidget {
  static String id = "VaccineInfoScreen";

  const VaccineInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VaccineInfoCubit(),
      child: Scaffold(
        appBar: CustomAppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: SvgPicture.asset(AppIcons.search),
            )
          ],
          title: LocaleKeys.generalArticlesVaccinations.tr(),
        ),
        body: const VaccineInfoBody(),
      ),
    );
  }
}
