import 'package:flutter/material.dart';
import 'package:gradutionproject/core/shared_widget/global_text.dart';
import 'package:gradutionproject/core/utils/app_colors.dart';
import 'package:gradutionproject/core/utils/app_images.dart';
import 'package:gradutionproject/core/utils/app_text.dart';
import 'package:gradutionproject/core/utils/extentions/screen_size.dart';
import 'package:gradutionproject/features/home/presentation/view/widgets/service_options_section.dart';

import 'header_home_section.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: HeaderHomeSection()),
            SliverToBoxAdapter(
                child: SizedBox(
              height: 16,
            )),
            SliverToBoxAdapter(child: ServiceOptionsSection()),
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
                  content: AppText.vaccinationTimeRemaining,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SliverToBoxAdapter(
                child: SizedBox(
              height: 16,
            )),
            SliverToBoxAdapter(
              child: FeatureHomeSection(),
            ),
          ],
        ));
  }
}

class FeatureHomeSection extends StatelessWidget {
  const FeatureHomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            FeatureHomeWidget(
              imagePath: AppImages.articleSideEffectHome,
              title: AppText.articlesSideEffects,
              onTap: () {

              },
            ),
            const SizedBox(),
            FeatureHomeWidget(
              imagePath: AppImages.adviceHomeImage,
              title: AppText.tipsBeforeAfterVaccination,
              onTap: () {

              },
            ),
          ],
        ),
        const SizedBox(height: 16,),
        Row(
          children: [
            FeatureHomeWidget(
              imagePath: AppImages.articleGeneralImage,
              title: AppText.generalArticlesVaccinations,
              onTap: () {

              },
            ),
            const SizedBox(),
            const FeatureHomeWidget(
              imagePath: AppImages.databasePharmaceuticalImage,
              title: AppText.medicationDatabase,
            ),
          ],
        ),
      ],
    );
  }
}

class FeatureHomeWidget extends StatelessWidget {
  final String imagePath;
  final String title;
  final void Function()? onTap;

  const FeatureHomeWidget(
      {super.key, required this.imagePath, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Image(
            image: AssetImage(
              imagePath,
            ),
            width: 0.4.w,
            height: 0.2.h,
            fit: BoxFit.fill,
          ),
          const SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: GText(
              color: const Color(0xff000099),
              content: title,
              fontSize: 16,
              fontWeight: FontWeight.w500,
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    ));
  }
}

//rgba(26, 30, 76, 1)
