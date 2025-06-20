import 'package:flutter/material.dart';
import 'package:gradutionproject/core/shared_widget/custom_row_buttons.dart';
import 'package:gradutionproject/core/utils/app_colors.dart';
import 'package:gradutionproject/core/utils/app_font_family.dart';
import 'package:gradutionproject/core/utils/app_images.dart';
import 'package:gradutionproject/core/utils/extentions/screen_size.dart';
import 'package:gradutionproject/core/shared_widget/custom_child_tile.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../../../core/utils/locale_keys.g.dart';

class NotificationDetailsBody extends StatelessWidget {
  const NotificationDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSpacer(height: 32),
                _buildSpacer(height: 32),
                _buildChildTile(),
                _buildSpacer(height: 32),
                _buildSpacer(height: 32),
                _buildTitleAndDescription(
                  title: LocaleKeys.vaccineNameLabel.tr(),
                  description: LocaleKeys.rotavirusVaccine.tr(),
                ),
                _buildTitleAndDescription(
                  title: LocaleKeys.vaccinationDateLabel.tr(),
                  description: "12/6/2025",
                ),
                _buildTitleAndDescription(
                  title: LocaleKeys.explanatoryText.tr(),
                  description: LocaleKeys.explanatoryTextDescr.tr(),
                ),
                _buildTitleAndDescription(
                  title: LocaleKeys.informativeNote.tr(),
                  description: LocaleKeys.textTest1.tr(),
                ),
                _buildTitleAndDescription(
                  title: LocaleKeys.advice.tr(),
                  description: LocaleKeys.textTest2.tr(),
                ),
                SliverToBoxAdapter(
                  child: CustomRowButtons(
                    titleBlueButton: LocaleKeys.confirm.tr(),
                    onTapBlueButton: () {},
                    titleWhiteButton: LocaleKeys.postpone.tr(),
                    onTapWhiteButton: () {},
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  SliverToBoxAdapter _buildSpacer({required double height}) {
    return SliverToBoxAdapter(
        child: SizedBox(
      height: height,
    ));
  }

  SliverToBoxAdapter _buildChildTile() {
    return SliverToBoxAdapter(
      child: CustomChildTile(
        imagePath: AppImages.childTest,
        title: LocaleKeys.childName.tr(),
        subTitle: LocaleKeys.yearAndFourMonth.tr(),
      ),
    );
  }

  SliverToBoxAdapter _buildTitleAndDescription(
      {required String title, required description}) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Text.rich(
            textAlign: TextAlign.right,
            TextSpan(
                text: title,
                style: const TextStyle(
                  fontFamily: AppFontFamily.cairoFontFamily,
                  color: AppColors.primaryColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
                children: [
                  TextSpan(
                    text: description,
                    style: const TextStyle(
                      fontFamily: AppFontFamily.cairoFontFamily,
                      color: AppColors.mediumGrayColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ])),
      ),
    );
  }
}
