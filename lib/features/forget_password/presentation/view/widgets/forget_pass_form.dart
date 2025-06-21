import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:gradutionproject/core/shared_widget/toast_utils.dart';
import 'package:gradutionproject/core/utils/extentions/screen_size.dart';
import 'package:gradutionproject/core/utils/validation_service.dart';
import '../../../../../core/navigation/navigation_manager.dart';
import '../../../../../core/shared_widget/custom_elevated_btn.dart';
import '../../../../../core/shared_widget/custom_text_form_field.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_icons.dart';
import '../../../../../core/utils/locale_keys.g.dart';
import '../verify_code_screen.dart';
import '../../view_model/change_pass_cubit/change_pass_cubit.dart';
import '../../view_model/change_pass_cubit/change_pass_state.dart';

class ForgetPassForm extends StatefulWidget {
  const ForgetPassForm({super.key});

  @override
  State<ForgetPassForm> createState() => _ForgetPassFormState();
}

class _ForgetPassFormState extends State<ForgetPassForm> {
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ChangePassCubit, ChangePassState>(
      listener: (context, state) {
        if (state is ForgetPasswordSuccessState) {
          // Show success message from backend
          ToastUtils.showToast(
            message: state.forgetPasswordResponse.message ?? "Succes Email",
            backgroundColor: Colors.green,
          );
          // Navigate to verify code screen after showing message
          NavigationManager.push(VerifyCodeScreen.id);
        } else if (state is ForgetPasswordFaliureState) {
          // Show error message from backend
          ToastUtils.showToast(message: state.errorMessage);
        }
      },
      child: BlocBuilder<ChangePassCubit, ChangePassState>(
        builder: (context, state) {
          return Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: SliverToBoxAdapter(
              child: Column(
                children: [
                  emailField(),
                  SizedBox(
                    height: 0.04.h,
                  ),
                  buttonNext(state),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget emailField() {
    return CustomTextField(
      controller: _emailController,
      hintText: LocaleKeys.enterEmailAddress.tr(),
      prefix: AppIcons.emailIcon,
      title: LocaleKeys.emailAddress.tr(),
      validator: (value) {
        return Validators.validateEmail(value);
      },
    );
  }

  Widget buttonNext(ChangePassState state) {
    final isLoading = state is ForgetPasswordLoadingState;

    return CustomElevatedButton(
      onPress: isLoading
          ? () {}
          : () {
              if (_formKey.currentState!.validate()) {
                context.read<ChangePassCubit>().forgotPassword(
                      email: _emailController.text.trim(),
                    );
              }
            },
      btnColor: AppColors.primaryColor,
      titleButton: isLoading ? "Loading..." : LocaleKeys.next.tr(),
    );
  }
}
