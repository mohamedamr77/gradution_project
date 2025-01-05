import 'package:flutter/material.dart';
import 'package:gradutionproject/core/utils/extentions/screen_size.dart';
import '../../../../../core/shared_widget/global_text.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text.dart';
import 'package:percent_indicator/percent_indicator.dart';

class TimeLeftsSection extends StatelessWidget {
  const TimeLeftsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Align(
          alignment: Alignment.centerRight,
          child: GText(
            textAlign: TextAlign.right,
            color: AppColors.primaryColor,
            content: AppText.vaccinationTimeRemaining,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 16),
        CircularPercentIndicator(
            radius: 0.19.w,
            lineWidth: 12.0,
            percent: 0.5,
            center: const Center(
                child: GText(
                    color: AppColors.darkBlueAccent,
                    content: "20 يوم : 1 شهر",
                    fontSize: 14)),
            progressColor: const Color(0xff27B9EF),
            progressBorderColor: const Color(0xff27B9EF),
            backgroundColor: AppColors.lightGrayColor4)
      ],
    );
  }
}
