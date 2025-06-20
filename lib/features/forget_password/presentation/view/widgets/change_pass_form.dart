import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradutionproject/core/utils/extentions/screen_size.dart';

import '../../../../../core/navigation/navigation_manager.dart';
import '../../../../../core/shared_widget/custom_elevated_btn.dart';
import '../../../../../core/shared_widget/custom_text_form_field.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_icons.dart';
import '../../../../../core/utils/locale_keys.g.dart';
import '../../../../../core/utils/validation_service.dart';
import '../../view_model/change_pass_cubit/change_pass_cubit.dart';
import '../change_pass_done_screen.dart';

class ChangePassForm extends StatelessWidget {
  const ChangePassForm({super.key});

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    AutovalidateMode autoValidateMode = AutovalidateMode.onUserInteraction;
    var cubit = BlocProvider.of<ChangePassCubit>(context);
    return Form(
      key: formKey,
      autovalidateMode: autoValidateMode,
      child: SliverToBoxAdapter(
        child: Column(
          children: [
            CustomTextField(
              hintText: LocaleKeys.enterPassword.tr(),
              prefix: AppIcons.passwordIcon,
              title: LocaleKeys.password.tr(),
              suffixIcon: AppIcons.visibilityOffIcon,
              validator: (value) {
                return Validators.validatePassword(value);
              },
              onChanged: (value) {
                cubit.password = value;
              },
            ),
            SizedBox(
              height: 0.02.h,
            ),
            CustomTextField(
              hintText: LocaleKeys.enterPassword.tr(),
              prefix: AppIcons.passwordIcon,
              title: LocaleKeys.confirmPassword.tr(),
              suffixIcon: AppIcons.visibilityOffIcon,
              validator: (value) {
                return Validators.validateConfirmPassword(
                    cubit.password, value);
              },
              onChanged: (value) {
                cubit.confirmPassword = value;
              },
            ),
            SizedBox(
              height: 0.04.h,
            ),
            CustomElevatedButton(
              onPress: () {
                if (formKey.currentState!.validate()) {
                  NavigationManager.push(ChangePassDoneScreen.id);
                }
              },
              btnColor: AppColors.primaryColor,
              titleButton: LocaleKeys.change.tr(),
            ),
          ],
        ),
      ),
    );
  }
}
