import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradutionproject/core/shared_widget/custom_elevated_btn.dart';
import 'package:gradutionproject/core/shared_widget/global_text.dart';
import 'package:gradutionproject/core/utils/app_colors.dart';
import 'package:gradutionproject/core/utils/app_icons.dart';
import 'package:gradutionproject/core/utils/app_images.dart';
import 'package:gradutionproject/core/utils/app_text.dart';
import 'package:gradutionproject/core/utils/extentions/screen_size.dart';

class LanguageBody extends StatelessWidget {
  const LanguageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Spacer(flex: 3,),
          Container(
            width: 0.6.w,
            padding:  EdgeInsets.symmetric(vertical: 0.015.h, horizontal: 0.02.w),
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              textDirection: TextDirection.rtl,
              children: [
                SvgPicture.asset(AppIcons.checkBoxCorrect,color: Colors.white,),
               Spacer(),
                GText(color: AppColors.whiteColor, content: AppText.arabicLanguage, fontSize: 18,fontWeight: FontWeight.w600,),
                Spacer(),
              ],
            ),
          ),
          Spacer(),
          Container(
            width: 0.6.w,
            padding:  EdgeInsets.symmetric(vertical: 0.015.h, horizontal: 0.02.w),
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              textDirection: TextDirection.rtl,
              children: [
                SvgPicture.asset(AppIcons.checkBoxCorrect,color: Colors.white,),
               Spacer(),
                GText(color: AppColors.whiteColor, content: AppText.arabicLanguage, fontSize: 18,fontWeight: FontWeight.w600,),
                Spacer(),
              ],
            ),
          ),
          Spacer(flex: 3,),
          CustomElevatedButton(onPress: () {

          }, titleButton: AppText.change),
          Spacer(flex: 5,),
        ],
      ),
    );
  }
}
