import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradutionproject/features/vaccine_info/presentation/viewModel/vaccine_info_state.dart';

import '../../../../../core/shared_widget/button_list_horizontal.dart';
import '../../../data/model/vaccine_info_list_button.dart';
import '../../viewModel/vaccine_info_cubit.dart';

class VaccineInfoButtons extends StatelessWidget {
  const VaccineInfoButtons({super.key});

  @override
  Widget build(BuildContext context) {
    VaccineInfoCubit cubit = BlocProvider.of<VaccineInfoCubit>(context);
    return  SliverToBoxAdapter(
      child: BlocBuilder<VaccineInfoCubit, VaccineInfoState>(
        builder: (context, state) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                  vaccineInfoListButton.length, (index) {
                return ButtonListHorizontal(
                  onTap: () => cubit.selectButton(index),
                  buttonNames: vaccineInfoListButton,
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
