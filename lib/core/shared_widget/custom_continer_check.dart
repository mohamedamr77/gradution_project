import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gradutionproject/core/utils/extentions/screen_size.dart';

import '../utils/app_colors.dart';
import '../utils/app_icons.dart';
import 'global_text.dart';

class CustomContainerCheck extends StatelessWidget {
  final bool isCheck;
  final String title;
  const CustomContainerCheck(
      {super.key, required this.isCheck, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 0.6.w,
      padding: EdgeInsets.symmetric(vertical: 0.015.h, horizontal: 0.02.w),
      decoration: BoxDecoration(
        color: isCheck ? AppColors.primaryColor : AppColors.secondaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        textDirection: TextDirection.rtl,
        children: [
          Visibility(
              visible: isCheck,
              child: SvgPicture.asset(
                AppIcons.checkBoxCorrect,
                color: Colors.white,
              )),
          Visibility(
              visible: isCheck == false,
              child: SvgPicture.asset(
                AppIcons.checkBoxEmpty,
                color: AppColors.darkGrayColor,
              )),
          const Spacer(),
          GText(
            color: isCheck ? AppColors.whiteColor : AppColors.darkBlueAccent,
            content: title,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
