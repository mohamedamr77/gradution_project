import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradutionproject/features/side_effects/data/model/button_side_effects_list.dart';
import 'package:gradutionproject/features/side_effects/presentation/view/widgets/side_effect_list_item.dart';
import 'package:gradutionproject/features/side_effects/presentation/view_model/side_effects_cubit.dart';
import 'package:gradutionproject/features/side_effects/presentation/view_model/side_effects_state.dart';

import '../../../../../core/shared_widget/button_list_horizontal.dart';

class SideEffectBody extends StatelessWidget {
  const SideEffectBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SideEffectsCubit, SideEffectsState>(
      builder: (context, state) {
        return CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(
                  buttonSideEffectsTitles.length,
                  (index) => ButtonListHorizontal(
                    buttonNames: buttonSideEffectsTitles,
                    index: index,
                    buttonSelectedIndex:
                        context.read<SideEffectsCubit>().buttonSelected,
                    onTap: () {
                      context.read<SideEffectsCubit>().selectButton(index);
                    },
                  ),
                ),
              ),
            ),
            const SideEffectListItem(),
          ],
        );
      },
    );
  }
}
