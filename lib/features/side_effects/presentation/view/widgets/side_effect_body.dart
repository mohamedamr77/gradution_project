import 'package:flutter/material.dart';
import 'package:gradutionproject/core/utils/extentions/screen_size.dart';
import 'package:gradutionproject/features/side_effects/presentation/view/widgets/side_effects_button.dart';
import 'package:gradutionproject/features/side_effects/presentation/view/widgets/side_effects_list_item.dart';

class SideEffectBody extends StatelessWidget {
  const SideEffectBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0.04.w, vertical: 0.02.h),
      child: const CustomScrollView(
        slivers: [
          SideEffectsButton(),
          SliverToBoxAdapter(child: SizedBox(height: 16)),
          SideEffectsListItem(),
        ],
      ),
    );
  }
}
