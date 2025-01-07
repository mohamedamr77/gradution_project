import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradutionproject/features/vaccine_times/data/model/vaccine_times_buttons_names_list.dart';
import 'package:gradutionproject/features/vaccine_times/presentation/viewModel/vaccine_times_cubit.dart';
import 'package:gradutionproject/features/vaccine_times/presentation/viewModel/vaccine_times_state.dart';

import '../../../../../core/shared_widget/button_list_horizontal.dart';

class VaccineTimesButtons extends StatelessWidget {
  const VaccineTimesButtons({super.key});

  @override
  Widget build(BuildContext context) {
    VaccineTimesCubit cubit = BlocProvider.of<VaccineTimesCubit>(context);
    return SliverToBoxAdapter(
      child: BlocBuilder<VaccineTimesCubit, VaccineTimesState>(
        builder: (context, state) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(vaccineTimesButtonNames.length, (index) {
                return ButtonListHorizontal(
                  onTap: () => cubit.selectButton(index),
                  buttonNames: vaccineTimesButtonNames,
                  index: index,
                  buttonSelectedIndex: cubit.buttonSelected,
                );
              }),
            ),
          );
        },
      ),
    );
  }
}
