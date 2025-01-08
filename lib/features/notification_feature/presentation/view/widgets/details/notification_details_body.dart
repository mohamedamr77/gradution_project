import 'package:flutter/material.dart';
import 'package:gradutionproject/core/shared_widget/custom_description_text.dart';
import 'package:gradutionproject/core/shared_widget/custom_row_buttons.dart';
import 'package:gradutionproject/core/shared_widget/custom_title_text.dart';
import 'package:gradutionproject/core/shared_widget/global_text.dart';
import 'package:gradutionproject/core/utils/app_colors.dart';
import 'package:gradutionproject/core/utils/app_images.dart';
import 'package:gradutionproject/core/utils/app_text.dart';
import 'package:gradutionproject/core/utils/extentions/screen_size.dart';
import 'package:gradutionproject/features/notification_feature/presentation/view/widgets/details/notification_details_card.dart';

class NotificationDetailsBody extends StatelessWidget {
  const NotificationDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0.04.w, vertical: 0.02.h),
      child: CustomScrollView(
        slivers: [
          _buildSpacer(height: 16),
          const NotificationDetailsCard(imagePath: AppImages.childTest, title: AppText.childName,subTitle: AppText.yearAndFourMonth,),
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
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          textDirection: TextDirection.rtl,
          children: [
            CustomTitleText(title:title),
            SizedBox(width: 4,),
            CustomDescriptionText(title: description , textSize: 16,),
          ],
        ),
      ),
    );
  }

}
