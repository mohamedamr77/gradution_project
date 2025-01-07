import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/shared_widget/button_list_horizontal.dart';
import '../../../data/model/side_effect_button_list.dart';
import '../../view_model/side_effects_cubit.dart';
import '../../view_model/side_effects_state.dart';

class SideEffectsButton extends StatelessWidget {
  const SideEffectsButton({super.key});

  @override
  Widget build(BuildContext context) {
    SideEffectsCubit cubit = BlocProvider.of<SideEffectsCubit>(context);
    return SliverToBoxAdapter(
      child: BlocBuilder<SideEffectsCubit, SideEffectsState>(
        builder: (context, state) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(sideEffectButtonList.length, (index) {
                return ButtonListHorizontal(
                  onTap: () => cubit.selectButton(index),
                  buttonNames: sideEffectButtonList,
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
