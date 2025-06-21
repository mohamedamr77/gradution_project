import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:gradutionproject/core/navigation/navigation_manager.dart';
import 'package:gradutionproject/core/shared_widget/custom_elevated_btn.dart';
import 'package:gradutionproject/core/shared_widget/name_screen.dart';
import 'package:gradutionproject/core/shared_widget/text_with_action_row%20.dart';
import 'package:gradutionproject/core/shared_widget/toast_utils.dart';
import 'package:gradutionproject/core/utils/app_colors.dart';
import 'package:gradutionproject/core/utils/app_images.dart';
import 'package:gradutionproject/core/utils/locale_keys.g.dart';
import 'package:gradutionproject/core/utils/extentions/screen_size.dart';
import 'package:gradutionproject/features/forget_password/presentation/view/widgets/image_forget_password.dart';
import 'package:gradutionproject/features/forget_password/presentation/view_model/change_pass_cubit/change_pass_cubit.dart';
import 'package:gradutionproject/features/forget_password/presentation/view_model/change_pass_cubit/change_pass_state.dart';

import '../change_pass_screen.dart';
import 'otp_text_form_field.dart';

class VerifyCodeBody extends StatefulWidget {
  const VerifyCodeBody({super.key});

  @override
  State<VerifyCodeBody> createState() => _VerifyCodeBodyState();
}

class _VerifyCodeBodyState extends State<VerifyCodeBody> {
  TextEditingController? numberOneController;
  TextEditingController? numberTwoController;
  TextEditingController? numberThreeController;
  TextEditingController? numberFourController;
  TextEditingController? numberFiveController;
  TextEditingController? numberSixController;

  bool isButtonEnabled = false;

  void checkFieldsFilled() {
    setState(() {
      isButtonEnabled = (numberOneController?.text.isNotEmpty ?? false) &&
          (numberTwoController?.text.isNotEmpty ?? false) &&
          (numberThreeController?.text.isNotEmpty ?? false) &&
          (numberFourController?.text.isNotEmpty ?? false) &&
          (numberFiveController?.text.isNotEmpty ?? false) &&
          (numberSixController?.text.isNotEmpty ?? false);
    });
  }

  String getOtpCode() {
    return '${numberOneController?.text ?? ''}${numberTwoController?.text ?? ''}${numberThreeController?.text ?? ''}${numberFourController?.text ?? ''}${numberFiveController?.text ?? ''}${numberSixController?.text ?? ''}';
  }

  @override
  void initState() {
    super.initState();

    numberOneController = TextEditingController();
    numberTwoController = TextEditingController();
    numberThreeController = TextEditingController();
    numberFourController = TextEditingController();
    numberFiveController = TextEditingController();
    numberSixController = TextEditingController();

    // Add listeners to the text fields to check when the content changes
    numberOneController?.addListener(checkFieldsFilled);
    numberTwoController?.addListener(checkFieldsFilled);
    numberThreeController?.addListener(checkFieldsFilled);
    numberFourController?.addListener(checkFieldsFilled);
    numberFiveController?.addListener(checkFieldsFilled);
    numberSixController?.addListener(checkFieldsFilled);
  }

  @override
  void dispose() {
    super.dispose();
    numberOneController?.dispose();
    numberTwoController?.dispose();
    numberThreeController?.dispose();
    numberFourController?.dispose();
    numberFiveController?.dispose();
    numberSixController?.dispose();
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
          NavigationManager.push(ChangePasswordScreen.id);
        } else if (state is ConfirmResetPasswordFaliureState) {
          // Show error message from backend
          ToastUtils.showToast(message: state.errorMessage);
        }
      },
      child: BlocBuilder<ChangePassCubit, ChangePassState>(
        builder: (context, state) {
          final isLoading = state is ConfirmResetPasswordLoadingState;

          return CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  children: [
                    const Spacer(
                      flex: 2,
                    ),
                    NameScreen(title: LocaleKeys.passwordResetCode.tr()),
                    const Spacer(),
                    const ImageForgetPassword(
                        imagePath: AppImages.confirmOtpScreen),
                    const Spacer(),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 0.05.w),
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        spacing: 0.02.w,
                        runSpacing: 0.02.h,
                        children: [
                          SizedBox(
                            width: 0.12.w,
                            child: OTPTextFormField(
                                controller: numberOneController),
                          ),
                          SizedBox(
                            width: 0.12.w,
                            child: OTPTextFormField(
                                controller: numberTwoController),
                          ),
                          SizedBox(
                            width: 0.12.w,
                            child: OTPTextFormField(
                                controller: numberThreeController),
                          ),
                          SizedBox(
                            width: 0.12.w,
                            child: OTPTextFormField(
                                controller: numberFourController),
                          ),
                          SizedBox(
                            width: 0.12.w,
                            child: OTPTextFormField(
                                controller: numberFiveController),
                          ),
                          SizedBox(
                            width: 0.12.w,
                            child: OTPTextFormField(
                                controller: numberSixController),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 0.05.w),
                      child: CustomElevatedButton(
                          btnColor: (isButtonEnabled && !isLoading) == false
                              ? AppColors.thirdColor
                              : AppColors.primaryColor,
                          onPress: (isButtonEnabled && !isLoading)
                              ? () {
                                  final otpCode = getOtpCode();
                                  context
                                      .read<ChangePassCubit>()
                                      .saveOtpCode(otpCode);
                                  // Navigate to change password screen to enter new password
                                  NavigationManager.push(
                                      ChangePasswordScreen.id);
                                }
                              : () {},
                          titleButton: isLoading
                              ? "Loading..."
                              : LocaleKeys.confirm.tr()),
                    ),
                    const Spacer(),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 0.05.w),
                      child: TextWithActionRow(
                        titleOnTap: LocaleKeys.resendCode.tr(),
                        titleWithoutTap: LocaleKeys.notHaveCode.tr(),
                        onTap: () {
                          // TODO: Implement resend code functionality
                        },
                      ),
                    ),
                    const Spacer(
                      flex: 3,
                    ),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
