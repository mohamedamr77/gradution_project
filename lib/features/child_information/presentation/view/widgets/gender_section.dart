import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gradutionproject/core/shared_widget/global_text.dart';
import 'package:gradutionproject/core/utils/extentions/screen_size.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_icons.dart';
import '../../../../../core/utils/app_text.dart';

class GenderSection extends StatefulWidget {
  const GenderSection({super.key});

  @override
  State<GenderSection> createState() => _GenderSectionState();
}

class _GenderSectionState extends State<GenderSection> {
  String? selectedGender;
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
            child: Row(
              textDirection: TextDirection.rtl,
              children: [
                SvgPicture.asset(AppIcons.emojiIcon),
                const Spacer(),
                Row(
                  textDirection: TextDirection.rtl,
                  children: [
                    Radio<String>(
                      value: 'female',
                      groupValue: selectedGender,
                      onChanged: (value) {
                        setState(() {
                          selectedGender = value;
                        });
                      },
                      activeColor: AppColors.primaryColor, // Active radio color
                    ),
                    const GText(
                      fontSize: 16,
                      color: AppColors.thirdColor,
                      content: AppText.female,
                    )
                  ],
                ),
                const Spacer(),
                Row(
                  textDirection: TextDirection.rtl,
                  children: [
                    Radio<String>(
                      value: 'male',
                      groupValue: selectedGender,
                      onChanged: (value) {
                        setState(() {
                          selectedGender = value;
                        });
                      },
                      activeColor: AppColors.primaryColor, // Active radio color
                    ),
                    const GText(
                      fontSize: 16,
                      color: AppColors.thirdColor,
                      content: AppText.male,
                    )
                  ],
                ),
                const Spacer(),
              ],
            ),
            // Spacing between options
            // Male Option
          ),
        ],
      ),
    );
  }
}

class Rad extends StatelessWidget {
  const Rad({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
