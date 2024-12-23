import 'package:flutter/material.dart';
import 'package:gradutionproject/core/shared_widget/custom_text_form_field.dart';
import 'package:gradutionproject/core/shared_widget/global_text.dart';
import 'package:gradutionproject/core/utils/app_colors.dart';
import 'package:gradutionproject/core/utils/app_icons.dart';
import 'package:gradutionproject/core/utils/app_text.dart';

import 'gender_section.dart';
import 'image_child_section.dart';

class ChildInfoBody extends StatelessWidget {
  const ChildInfoBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Center(
          child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
              child: SizedBox(
            height: 16,
          )),
          SliverToBoxAdapter(
            child: GText(
                textAlign: TextAlign.center,
                color: AppColors.primaryColor,
                content: AppText.welcomeMessage,
                fontSize: 18),
          ),
          SliverToBoxAdapter(
              child: SizedBox(
            height: 16,
          )),
          SliverToBoxAdapter(child: ImageChildSection()),
          SliverToBoxAdapter(
              child: SizedBox(
            height: 32,
          )),
          SliverToBoxAdapter(
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
          ),
          SliverToBoxAdapter(
              child: SizedBox(
            height: 16,
          )),
          SliverToBoxAdapter(
            child: CustomTextField(
                hintText: AppText.enterYourName,
                prefix: AppIcons.nameIcon,
                title: AppText.name),
          ),
          SliverToBoxAdapter(
              child: SizedBox(
            height: 16,
          )),
          SliverToBoxAdapter(
            child: CustomTextField(
                hintText: AppText.height, title: AppText.height),
          ),
          SliverToBoxAdapter(
              child: SizedBox(
            height: 16,
          )),
          SliverToBoxAdapter(
            child: GenderSection(),
          ),
          SliverToBoxAdapter(
              child: SizedBox(
            height: 16,
          )),
          SliverToBoxAdapter(
            child: CustomTextField(
                hintText: AppText.weight, title: AppText.weight),
          ),
          SliverToBoxAdapter(
              child: SizedBox(
            height: 16,
          )),
          SliverToBoxAdapter(
            child: CustomTextField(
                hintText: ".............", title: AppText.childVaccines),
          ),
          SliverToBoxAdapter(
              child: SizedBox(
            height: 16,
          )),
          SliverToBoxAdapter(
            child: CustomTextField(
                hintText: ".............", title: AppText.childDiseases),
          ),
        ],
      )),
    );
  }
}
