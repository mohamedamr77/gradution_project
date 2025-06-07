import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradutionproject/core/shared_widget/global_text.dart';
import 'package:gradutionproject/core/utils/app_colors.dart';
import 'package:gradutionproject/core/utils/app_icons.dart';
import 'package:gradutionproject/core/utils/app_text.dart';
import 'package:gradutionproject/core/utils/extentions/screen_size.dart';
import 'package:gradutionproject/core/utils/locale_keys.g.dart';
import 'package:gradutionproject/features/child_information/presentation/view_model/child_information_state.dart';
import 'package:gradutionproject/features/child_information/presentation/view_model/child_informtion_cubit.dart';

class ImageChildSection extends StatelessWidget {
  const ImageChildSection({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<ChildInformationCubit>(context);
    return BlocConsumer<ChildInformationCubit, ChildInformationState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (BuildContext context, ChildInformationState state) {
        return Column(
          children: [
            GestureDetector(
              onTap: () {
                cubit.pickImage();
              },
              child: CircleAvatar(
                radius: 0.13.w,
                backgroundColor: AppColors.grayColor,
                child: cubit.image == null
                    ? AppIcons.cameraIcon
                    : CircleAvatar(
                        radius: 0.2.w,
                        backgroundImage: FileImage(File(cubit.image!.path))),
              ),
            ),
            SizedBox(
              height: 0.02.h,
            ),
            GestureDetector(
              onTap: () => cubit.pickImage(),
              child: GText(
                color: AppColors.grayBlackColor,
                content: cubit.image == null
                    ? LocaleKeys.addChildPhoto.tr()
                    : LocaleKeys.editPhoto.tr(),
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        );
      },
    );
  }
}
