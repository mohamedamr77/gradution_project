import 'package:flutter/material.dart';
import 'package:gradutionproject/core/utils/extentions/screen_size.dart';

import '../utils/app_colors.dart';
import 'global_text.dart';

class ButtonService{
 static Widget activeButton({required String title}){
    return Container(
      width: 0.42.w,
      padding: const EdgeInsets.symmetric(
          vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius:
        BorderRadius.circular(20),
      ),
      child:  Center(
        child: GText(
          color: AppColors.whiteColor,
          content: title,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

 static Widget inactiveButton({required String title}){
    return  Container(
      width: 0.42.w,
      padding: const EdgeInsets.symmetric(
          vertical: 12),
      decoration: BoxDecoration(
          color: AppColors.secondaryColor,
          borderRadius:
          BorderRadius.circular(20),
          border: Border.all(
              color:
              AppColors.primaryColor)),
      child:  Center(
        child: GText(
          color: AppColors.primaryColor,
          content: title,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}