import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradutionproject/core/utils/extentions/screen_size.dart';
import 'package:gradutionproject/features/vaccine_info/presentation/view/widgets/vaccine_info_buttons.dart';
import 'package:gradutionproject/features/vaccine_info/presentation/view/widgets/vaccine_info_list_item.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/article/presentation/view_model/article/article_cubit.dart';
import '../../../../../core/article/presentation/view_model/article/article_state.dart';

class VaccineInfoBody extends StatelessWidget {
  const VaccineInfoBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticleCubit, ArticleState>(
      builder: (context, state) {
        return Skeletonizer(
          enabled: state is ArticleLoadingState,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 0.04.w, vertical: 0.02.h),
            child: const CustomScrollView(
              slivers: [
                VaccineInfoButtons(),
                SliverToBoxAdapter(child: SizedBox(height: 16)),
                VaccineInfoListItem(),
              ],
            ),
          ),
        );
      },
    );
  }
}
