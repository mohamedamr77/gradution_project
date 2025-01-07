import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gradutionproject/features/medicines/presentation/view/widgets/medicines_body.dart';
import 'package:gradutionproject/features/medicines/presentation/viewModel/medicines_cubit.dart';

import '../../../../core/navigation/navigation_manager.dart';
import '../../../../core/shared_widget/custom_app_bar.dart';
import '../../../../core/utils/app_icons.dart';
import '../../../../core/utils/app_text.dart';

class MedicinesScreen extends StatelessWidget {
  static String id = "MedicinesScreen";
  const MedicinesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MedicinesCubit(),
      child: Scaffold(
        appBar: CustomAppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: SvgPicture.asset(AppIcons.search),
            )
          ],
          title: AppText.recommendedMedications,
          onBackPressed: () {
            NavigationManager.goBack();
          },
        ),
        body: const MedicinesBody(),
      ),
    );
  }
}
