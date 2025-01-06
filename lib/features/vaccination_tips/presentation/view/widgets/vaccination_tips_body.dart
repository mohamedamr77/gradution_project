import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradutionproject/core/utils/extentions/screen_size.dart';
import 'package:gradutionproject/features/vaccination_tips/presentation/view/widgets/vaccin_tips_list_item.dart';
import 'package:gradutionproject/features/vaccination_tips/presentation/view/widgets/vaccination_tips_button.dart';

import '../../viewModel/vaccination_tips_cubit.dart';

class VaccinationTipsBody extends StatelessWidget {
  const VaccinationTipsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0.04.w, vertical: 0.02.h),
      child: const CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: SizedBox(height: 16)),
          VaccinationTipsButton(),
           SliverToBoxAdapter(child: SizedBox(height: 16)),
          VaccinationTipsListItem(),
        ],
      ),
    );
  }
}
