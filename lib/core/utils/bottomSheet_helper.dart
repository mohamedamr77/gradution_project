import 'package:flutter/material.dart';
import 'package:gradutionproject/core/utils/app_colors.dart';

import '../navigation/navigation_manager.dart';
import '../shared_widget/global_text.dart';

class BottomSheetHelper {
  static void customShowModelSheet({
    required String title,
    required String subTitle,
    required Widget button,
  }) {
    showModalBottomSheet(
      backgroundColor: AppColors.lightGrayColor,
      context: NavigationManager.currentContext!, builder: (context) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 40,),
          GText(color: AppColors.darkCharcoalColor, content: title, fontSize: 18),
          const SizedBox(height: 8,),
          GText(color:AppColors.mediumGrayColor, content:subTitle, fontSize: 16),
          const SizedBox(height: 32,),
          button,
          const SizedBox(height: 32,),
        ],
      );
    },);
  }
}

/*
      showModalBottomSheet(
        backgroundColor: Color(0xffF6F6F6),
        context: NavigationManager.currentContext!, builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 40,),
            GText(color: Color(0xff262626), content: "حذف جميع الإشعارات", fontSize: 18),
            SizedBox(height: 8,),
            GText(color: Color(0xff6D6D6D), content: "هل أنت متأكد أنك تريد حذف جميع الإشعارات؟", fontSize: 16),
            SizedBox(height: 32,),
            CustomRowButtons(titleBlueButton: "حذف", onTapBlueButton: () {

            }, titleWhiteButton: "الغاء", onTapWhiteButton: () {},),
            SizedBox(height: 32,),
          ],
        );
      },)
 */
