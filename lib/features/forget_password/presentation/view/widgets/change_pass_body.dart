import 'package:flutter/material.dart';
import 'package:gradutionproject/core/utils/extentions/screen_size.dart';
import 'package:gradutionproject/features/forget_password/presentation/view/widgets/change_pass_form.dart';

import '../../../../../core/navigation/navigation_manager.dart';
import '../../../../../core/shared_widget/name_screen.dart';
import '../../../../../core/utils/app_icons.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_text.dart';
import 'image_forget_password.dart';

class ChangePassBody extends StatelessWidget {
  const ChangePassBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
              child: SizedBox(
            height: 20,
          )),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 0.03.w),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: InkWell(
                      onTap: () => NavigationManager.goBack(),
                      child: AppIcons.navigateIcon)),
            ),
          ),
          SliverToBoxAdapter(
              child: SizedBox(
            height: 0.04.h,
          )),
          const SliverToBoxAdapter(
              child: NameScreen(title: AppText.changePassword)),
          SliverToBoxAdapter(
              child: SizedBox(
            height: 0.04.h,
          )),
          const SliverToBoxAdapter(
              child: ImageForgetPassword(
                  imagePath: AppImages.changePasswordScreen)),
          SliverToBoxAdapter(
              child: SizedBox(
            height: 0.04.h,
          )),
          const ChangePassForm(),
          SliverToBoxAdapter(
              child: SizedBox(
            height: 0.04.h,
          )),
        ],
      ),
    );
  }
}
