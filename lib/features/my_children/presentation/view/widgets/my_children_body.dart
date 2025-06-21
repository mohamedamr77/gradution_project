import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradutionproject/core/shared_widget/custom_child_tile.dart';
import 'package:gradutionproject/core/utils/app_colors.dart';
import 'package:gradutionproject/core/utils/app_icons.dart';
import 'package:gradutionproject/core/utils/app_images.dart';
import 'package:gradutionproject/core/utils/extentions/screen_size.dart';
import 'package:gradutionproject/core/utils/locale_keys.g.dart';
import 'package:gradutionproject/features/my_children/presentation/view_model/my_children_cubit.dart';
import 'package:gradutionproject/features/my_children/presentation/view_model/my_children_state.dart';

class MyChildrenBody extends StatelessWidget {
  const MyChildrenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyChildrenCubit, MyChildrenState>(
      builder: (context, state) {
        if (state is MyChildrenLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is MyChildrenErrorState) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.error_outline,
                  size: 64,
                  color: AppColors.redColor,
                ),
                SizedBox(height: 16),
                Text(
                  state.message,
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.redColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    context.read<MyChildrenCubit>().getMyChildren();
                  },
                  child: Text("Retry"),
                ),
              ],
            ),
          );
        } else if (state is MyChildrenSuccessState) {
          final children = state.childResponse.data?.rows ?? [];

          if (children.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.child_care_outlined,
                    size: 64,
                    color: AppColors.grayColor,
                  ),
                  SizedBox(height: 16),
                  Text(
                    "No children found",
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.grayColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          }

          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 0.04.w, vertical: 0.02.h),
            child: CustomScrollView(
              slivers: [
                SliverList.builder(
                  itemBuilder: (context, index) {
                    final child = children[index];
                    return CustomChildTile(
                      imagePath: child.imageUrl ?? AppImages.childTest,
                      title: "${child.firstName ?? ''} ${child.lastName ?? ''}"
                          .trim(),
                      subTitle: _formatDateOfBirth(child.dateOfBirth),
                      leading: SvgPicture.asset(AppIcons.pencilSquare),
                    );
                  },
                  itemCount: children.length,
                )
              ],
            ),
          );
        }

        // Initial state
        return const SizedBox.shrink();
      },
    );
  }

  String _formatDateOfBirth(String? dateOfBirth) {
    if (dateOfBirth == null) return "No date available";

    try {
      final date = DateTime.parse(dateOfBirth);
      final now = DateTime.now();
      final difference = now.difference(date);
      final years = difference.inDays ~/ 365;
      final months = (difference.inDays % 365) ~/ 30;

      if (years > 0) {
        return months > 0 ? "$years years $months months" : "$years years";
      } else {
        return "$months months";
      }
    } catch (e) {
      return "Invalid date";
    }
  }
}
