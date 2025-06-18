import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:gradutionproject/core/shared_widget/global_text.dart';
import 'package:gradutionproject/core/utils/extentions/screen_size.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_icons.dart';
import '../../../../../core/utils/locale_keys.g.dart';
import 'package:gradutionproject/features/child_information/data/model/child_rquest_model.dart';
import 'package:gradutionproject/features/child_information/presentation/view_model/child_informtion_cubit.dart';

class GenderSection extends StatefulWidget {
  const GenderSection({super.key});

  @override
  State<GenderSection> createState() => _GenderSectionState();
}

class _GenderSectionState extends State<GenderSection> {
  String? selectedGender;
  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<ChildInformationCubit>(context);
    return SliverToBoxAdapter(
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: GText(
              color: AppColors.thirdColor,
              content: LocaleKeys.gender.tr(),
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
              children: [
                SvgPicture.asset(AppIcons.emojiIcon),
                const Spacer(),
                Row(
                  children: [
                    Radio<String>(
                      value: 'Female',
                      groupValue: selectedGender,
                      onChanged: (value) {
                        setState(() {
                          selectedGender = value;
                        });
                        final old = cubit.childRequestModel;
                        cubit.childRequestModel = ChildRequestModel(
                          firstName: old?.firstName,
                          lastName: old?.lastName,
                          dateOfBirth: old?.dateOfBirth,
                          gender: value,
                          height: old?.height,
                          weight: old?.weight,
                        );
                      },
                      activeColor: AppColors.primaryColor,
                    ),
                    GText(
                      fontSize: 16,
                      color: AppColors.thirdColor,
                      content: LocaleKeys.female1.tr(),
                    )
                  ],
                ),
                const Spacer(),
                Row(
                  children: [
                    Radio<String>(
                      value: 'Male',
                      groupValue: selectedGender,
                      onChanged: (value) {
                        setState(() {
                          selectedGender = value;
                        });
                        final old = cubit.childRequestModel;
                        cubit.childRequestModel = ChildRequestModel(
                          firstName: old?.firstName,
                          lastName: old?.lastName,
                          dateOfBirth: old?.dateOfBirth,
                          gender: value,
                          height: old?.height,
                          weight: old?.weight,
                        );
                      },
                      activeColor: AppColors.primaryColor,
                    ),
                    GText(
                      fontSize: 16,
                      color: AppColors.thirdColor,
                      content: LocaleKeys.male1.tr(),
                    )
                  ],
                ),
                const Spacer(),
              ],
            ),
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
