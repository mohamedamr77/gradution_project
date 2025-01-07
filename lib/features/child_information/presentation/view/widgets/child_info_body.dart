import 'package:flutter/material.dart';
import 'package:gradutionproject/core/shared_widget/custom_elevated_btn.dart';
import 'package:gradutionproject/core/shared_widget/global_text.dart';
import 'package:gradutionproject/core/utils/app_colors.dart';
import 'package:gradutionproject/core/utils/app_text.dart';
import 'package:gradutionproject/features/child_information/presentation/view/widgets/text_top_screen_child_info.dart';
import 'package:gradutionproject/features/child_information/presentation/view/widgets/vaccines_field_child_info.dart';
import 'package:gradutionproject/features/child_information/presentation/view/widgets/weight_field_child_info.dart';
import 'birth_date_section.dart';
import 'diseas_field_child_info.dart';
import 'gender_section.dart';
import 'height_field_child_info.dart';
import 'image_child_section.dart';
import 'name_field_child_info.dart';

class ChildInfoBody extends StatelessWidget {
  const ChildInfoBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Center(
          child: CustomScrollView(
        slivers: [
          spaceBetweenWidget(height: 8),
          const TextTopScreenChildInfo(),
          spaceBetweenWidget(),
          const SliverToBoxAdapter(child: ImageChildSection()),
          spaceBetweenWidget(height: 24),
          textCenterChildInfo(),
          spaceBetweenWidget(),
          const NameFieldChildInfo(),
          spaceBetweenWidget(),
          const BirthDateSection(),
          spaceBetweenWidget(),
          const HeightFieldChildInfo(),
          spaceBetweenWidget(),
          const WeightFieldChildInfo(),
          spaceBetweenWidget(),
          const GenderSection(),
          spaceBetweenWidget(),
          const DiseasesFieldChildInfo(),
          spaceBetweenWidget(),
          const VaccinesFieldChildInfo(),
          spaceBetweenWidget(),
          SliverToBoxAdapter(
            child: CustomElevatedButton(
              onPress: () {},
              titleButton: AppText.register,
            ),
          ),
          spaceBetweenWidget(),
        ],
      )),
    );
  }

  Widget spaceBetweenWidget({double? height, double? width}) {
    return SliverToBoxAdapter(
        child: SizedBox(height: height ?? 16, width: width ?? 0));
  }

  Widget textCenterChildInfo() {
    return const SliverToBoxAdapter(
      child: Align(
        alignment: Alignment.centerRight,
        child: GText(
          textAlign: TextAlign.right,
          color: AppColors.primaryColor,
          content: AppText.registerChildData,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
