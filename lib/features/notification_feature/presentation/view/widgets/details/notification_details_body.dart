import 'package:flutter/material.dart';
import 'package:gradutionproject/core/shared_widget/custom_row_buttons.dart';
import 'package:gradutionproject/core/utils/app_colors.dart';
import 'package:gradutionproject/core/utils/app_font_family.dart';
import 'package:gradutionproject/core/utils/app_images.dart';
import 'package:gradutionproject/core/utils/app_text.dart';
import 'package:gradutionproject/core/utils/extentions/screen_size.dart';
import 'package:gradutionproject/core/shared_widget/custom_child_tile.dart';

class NotificationDetailsBody extends StatelessWidget {
  const NotificationDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0.04.w, vertical: 0.02.h),
      child: CustomScrollView(
        slivers: [
          _buildSpacer(height: 16),
           const SliverToBoxAdapter(child: CustomChildTile(imagePath: AppImages.childTest, title: AppText.childName,subTitle: AppText.yearAndFourMonth,)),
          _buildSpacer(height: 32),
          _buildSpacer(height: 32),
          _buildTitleAndDescription(
              title:  AppText.vaccineNameLabel,
              description: AppText.rotavirusVaccine
          ),
          _buildTitleAndDescription(
              title:  AppText.vaccinationDateLabel,
              description: "12/6/2025"
          ),
          // _buildTitleAndDescription(
          //     title:  AppText.vaccineNameLabel,
          //     description: AppText.rotavirusVaccine
          // ),
          _buildTitleAndDescription(
              title:  AppText.explanatoryText,
              description: AppText.explanatoryTextDescr
          ),
          _buildTitleAndDescription(
              title:  AppText.informativeNote,
              description: AppText.textTest1
          ),
          _buildTitleAndDescription(
              title:  AppText.advice,
              description: AppText.textTest2
          ),
          SliverToBoxAdapter(
            child: CustomRowButtons(
                titleBlueButton: AppText.confirm ,
                onTapBlueButton:() {},
                titleWhiteButton: AppText.postpone,
                onTapWhiteButton: () {},)
          )
        ],
      ),
    );
  }
  SliverToBoxAdapter _buildSpacer({required double height}){
    return SliverToBoxAdapter(child: SizedBox(height: height,));
  }
  SliverToBoxAdapter _buildTitleAndDescription({required String title, required description}){
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Text.rich(
            textAlign: TextAlign.right,
            textDirection: TextDirection.rtl,
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
                    text:
                    description,
                    style: const TextStyle(
                      fontFamily: AppFontFamily.cairoFontFamily,
                      color: AppColors.mediumGrayColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ])
        ),
      ),
    );
  }

}

