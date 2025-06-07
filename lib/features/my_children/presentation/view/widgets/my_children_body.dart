import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradutionproject/core/shared_widget/custom_child_tile.dart';
import 'package:gradutionproject/core/utils/app_icons.dart';
import 'package:gradutionproject/core/utils/app_images.dart';
import 'package:gradutionproject/core/utils/extentions/screen_size.dart';
import 'package:gradutionproject/core/utils/locale_keys.g.dart';
import '../../../../../core/utils/app_text.dart';

class MyChildrenBody extends StatelessWidget {
  const MyChildrenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0.04.w, vertical: 0.02.h),
      child: CustomScrollView(
        slivers: [
          SliverList.builder(
            itemBuilder: (context, index) {
              return CustomChildTile(
                imagePath: AppImages.childTest,
                title: LocaleKeys.childName.tr(),
                subTitle: LocaleKeys.yearAndFourMonth.tr(),
                leading: SvgPicture.asset(AppIcons.pencilSquare),
              );
            },
            itemCount: 4,
          )
        ],
      ),
    );
  }
}
