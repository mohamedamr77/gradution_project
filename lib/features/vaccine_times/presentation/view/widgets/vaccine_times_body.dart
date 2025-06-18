import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradutionproject/features/vaccine_times/presentation/view/widgets/vaccine_times_buttons.dart';
import 'package:gradutionproject/features/vaccine_times/presentation/view/widgets/vaccine_times_list_items.dart';
import 'package:gradutionproject/features/vaccine_times/presentation/viewModel/vaccine_cubit/vaccine_cubit.dart';
import 'package:gradutionproject/features/vaccine_times/presentation/viewModel/vaccine_cubit/vaccine_state.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/shared_widget/header_home_section.dart';

class VaccineTimesBody extends StatelessWidget {
  const VaccineTimesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 16,
        left: 16,
        right: 16,
      ),
      child: BlocBuilder<VaccineCubit, VaccineState>(
        builder: (context, state) {
          return Skeletonizer(
              enabled: state is VaccineLoadingState,
              child: const CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(child: HeaderBottomNavBarScreen()),
                  SliverToBoxAdapter(
                      child: SizedBox(
                        height: 16,
                      )),
                  VaccineTimesButtons(),
                  SliverToBoxAdapter(
                      child: SizedBox(
                        height: 16,
                      )),
                  VaccineTimesListItems(),
                ],
              ) );
        },
      ),
    );
  }
}
