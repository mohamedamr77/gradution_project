import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradutionproject/features/vaccination_tips/presentation/viewModel/vaccination_tips_cubit.dart';
import 'package:gradutionproject/features/vaccination_tips/presentation/viewModel/vaccination_tips_state.dart';

import '../../../../../core/shared_widget/button_list_horizontal.dart';
import '../../../data/model/button_vaccination_tips_list.dart';

class VaccinationTipsButton extends StatelessWidget {
  const VaccinationTipsButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<VaccinationTipsCubit>(context);
    return SliverToBoxAdapter(
      child: BlocBuilder<VaccinationTipsCubit, VaccinationTipsState>(
        builder: (context, state) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:
                  List.generate(buttonVaccinationTipsTitles.length, (index) {
                return ButtonListHorizontal(
                  onTap: () => cubit.selectButton(index),
                  buttonNames: buttonVaccinationTipsTitles,
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
