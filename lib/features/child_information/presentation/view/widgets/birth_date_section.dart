import 'package:flutter/material.dart';
import 'package:gradutionproject/core/utils/extentions/screen_size.dart';

import '../../../../../core/shared_widget/global_text.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text.dart';

class BirthDateSection extends StatelessWidget {
  const BirthDateSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          const Align(
            alignment: Alignment.centerRight,
            child: GText(
              color: AppColors.thirdColor,
              content: AppText.gender,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 11),
            width: double.infinity,
            height: 0.07.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: AppColors.thirdColor,
                )),
            child: const Row(
              textDirection: TextDirection.rtl,
              children: [
                Icon(Icons.date_range,color: AppColors.thirdColor,),
                SizedBox(width: 8),
                GText(
                  fontSize: 16,
                  color: AppColors.thirdColor,
                  content: AppText.enterBirthDate,
                )
              ],
            ),
          )
      
        ],
      ),
    );
  }
}
