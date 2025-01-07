import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradutionproject/features/medicines/presentation/viewModel/medicines_cubit.dart';
import 'package:gradutionproject/features/medicines/presentation/viewModel/medicines_state.dart';

import '../../../../../core/shared_widget/button_list_horizontal.dart';
import '../../../data/model/mediciens_list_button.dart';

class MedicinesButtons extends StatelessWidget {
  const MedicinesButtons({super.key});

  @override
  Widget build(BuildContext context) {
    MedicinesCubit cubit = BlocProvider.of<MedicinesCubit>(context);
    return SliverToBoxAdapter(
      child: BlocBuilder<MedicinesCubit, MedicinesState>(
        builder: (context, state) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(medicineButtonsList.length, (index) {
                return ButtonListHorizontal(
                  onTap: () => cubit.selectButton(index),
                  buttonNames: medicineButtonsList,
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
