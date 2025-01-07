import 'package:flutter/material.dart';
import 'package:gradutionproject/core/navigation/navigation_manager.dart';
import 'package:gradutionproject/core/shared_widget/name_screen.dart';
import 'package:gradutionproject/core/utils/app_images.dart';
import 'package:gradutionproject/core/utils/app_text.dart';
import 'package:gradutionproject/core/utils/extentions/screen_size.dart';
import 'package:gradutionproject/features/forget_password/presentation/view/widgets/forget_pass_form.dart';
import 'package:gradutionproject/features/forget_password/presentation/view/widgets/image_forget_password.dart';
import '../../../../../core/utils/app_icons.dart';

class ForgetPassBody extends StatelessWidget {
  const ForgetPassBody({super.key});

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
                child: NameScreen(title: AppText.forgotPassword)),
            SliverToBoxAdapter(
                child: SizedBox(
              height: 0.04.h,
            )),
            const SliverToBoxAdapter(
                child: ImageForgetPassword(
                    imagePath: AppImages.forgetPasswordScreen)),
            SliverToBoxAdapter(
                child: SizedBox(
              height: 0.04.h,
            )),
            const ForgetPassForm(),
            SliverToBoxAdapter(
                child: SizedBox(
              height: 0.1.h,
            )),
          ],
        ));
  }
}
