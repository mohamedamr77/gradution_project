import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradutionproject/core/shared_widget/toast_utils.dart';
import 'package:gradutionproject/core/utils/extentions/screen_size.dart';

import '../../../../../core/navigation/navigation_manager.dart';
import '../../../../../core/shared_widget/custom_elevated_btn.dart';
import '../../../../../core/shared_widget/custom_text_form_field.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_icons.dart';
import '../../../../../core/utils/locale_keys.g.dart';
import '../../../../../core/utils/validation_service.dart';
import '../../view_model/change_pass_cubit/change_pass_cubit.dart';
import '../../view_model/change_pass_cubit/change_pass_state.dart';
import '../change_pass_done_screen.dart';

class ChangePassForm extends StatefulWidget {
  const ChangePassForm({super.key});

  @override
  State<ChangePassForm> createState() => _ChangePassFormState();
}

class _ChangePassFormState extends State<ChangePassForm> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ChangePassCubit, ChangePassState>(
      listener: (context, state) {
        if (state is ConfirmResetPasswordSuccessState) {
          // Show success message from backend
          ToastUtils.showToast(
            message: state.message,
            backgroundColor: Colors.green,
          );
          // Navigate to success screen after showing message
          NavigationManager.push(ChangePassDoneScreen.id);
        } else if (state is ConfirmResetPasswordFaliureState) {
          // Show error message from backend
          ToastUtils.showToast(message: state.errorMessage);
        }
      },
      child: BlocBuilder<ChangePassCubit, ChangePassState>(
        builder: (context, state) {
          final isLoading = state is ConfirmResetPasswordLoadingState;

          return Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: SliverToBoxAdapter(
              child: Column(
                children: [
                  CustomTextField(
                    controller: _passwordController,
                    hintText: LocaleKeys.enterPassword.tr(),
                    prefix: AppIcons.passwordIcon,
                    title: LocaleKeys.password.tr(),
                    suffixIcon: AppIcons.visibilityOffIcon,
                    validator: (value) {
                      return Validators.validatePassword(value);
                    },
                    onChanged: (value) {
                      context.read<ChangePassCubit>().saveNewPassword(value);
                    },
                  ),
                  SizedBox(
                    height: 0.02.h,
                  ),
                  CustomTextField(
                    controller: _confirmPasswordController,
                    hintText: LocaleKeys.enterPassword.tr(),
                    prefix: AppIcons.passwordIcon,
                    title: LocaleKeys.confirmPassword.tr(),
                    suffixIcon: AppIcons.visibilityOffIcon,
                    validator: (value) {
                      return Validators.validateConfirmPassword(
                          _passwordController.text, value);
                    },
                    onChanged: (value) {
                      context.read<ChangePassCubit>().confirmPassword = value;
                    },
                  ),
                  SizedBox(
                    height: 0.04.h,
                  ),
                  CustomElevatedButton(
                    onPress: isLoading
                        ? () {}
                        : () {
                            if (_formKey.currentState!.validate()) {
                              final cubit = context.read<ChangePassCubit>();
                              if (cubit.otpCode != null) {
                                cubit.confirmResetCode(
                                  code: cubit.otpCode!,
                                  newPassword: _passwordController.text,
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                        "OTP code not found. Please go back and enter the code."),
                                    backgroundColor: AppColors.redColor,
                                  ),
                                );
                              }
                            }
                          },
                    btnColor: AppColors.primaryColor,
                    titleButton:
                        isLoading ? "Loading..." : LocaleKeys.change.tr(),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
