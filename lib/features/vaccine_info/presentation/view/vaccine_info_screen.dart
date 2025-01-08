import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gradutionproject/features/vaccine_info/presentation/view/widgets/vaccine_info_body.dart';
import 'package:gradutionproject/features/vaccine_info/presentation/viewModel/vaccine_info_cubit.dart';

import '../../../../core/shared_widget/custom_app_bar.dart';
import '../../../../core/utils/app_icons.dart';
import '../../../../core/utils/app_text.dart';

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
          title: AppText.generalArticlesVaccinations,
        ),
        body: const VaccineInfoBody(),
      ),
    );
  }
}
