import 'package:flutter/material.dart';
import 'package:gradutionproject/core/navigation/navigation_manager.dart';
import 'package:gradutionproject/core/shared_widget/custom_elevated_btn.dart';
import 'package:gradutionproject/core/shared_widget/global_text.dart';
import 'package:gradutionproject/core/utils/app_colors.dart';
import 'package:gradutionproject/features/bottom_nav_bar/presentation/view/bottom_nav_bar_screen.dart';
import 'package:gradutionproject/features/child_information/presentation/view/widgets/text_top_screen_child_info.dart';
import 'package:gradutionproject/features/child_information/presentation/view/widgets/vaccines_field_child_info.dart';
import 'package:gradutionproject/features/child_information/presentation/view/widgets/weight_field_child_info.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:gradutionproject/features/child_information/presentation/view_model/child_information_state.dart';
import '../../../../../../core/utils/locale_keys.g.dart';
import '../../../../auth/sign_up/presentation/view/widgets/name_field_sign_up.dart';
import 'birth_date_section.dart';
import 'diseas_field_child_info.dart';
import 'gender_section.dart';
import 'height_field_child_info.dart';
import 'image_child_section.dart';
import 'name_field_child_info.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradutionproject/core/shared_widget/toast_utils.dart';
import 'package:gradutionproject/features/child_information/presentation/view_model/child_informtion_cubit.dart';
import 'package:gradutionproject/features/child_information/data/model/child_rquest_model.dart';
import 'package:gradutionproject/core/shared_widget/custom_text_form_field.dart';

class ChildInfoBody extends StatefulWidget {
  const ChildInfoBody({super.key});

  @override
  State<ChildInfoBody> createState() => _ChildInfoBodyState();
}

class _ChildInfoBodyState extends State<ChildInfoBody> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _heightController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  void _onRegisterPressed(BuildContext context) {
    final cubit = context.read<ChildInformationCubit>();
    final firstName = _firstNameController.text.trim();
    final lastName = _lastNameController.text.trim();
    final height = _heightController.text.trim();
    final weight = _weightController.text.trim();
    final gender = cubit.childRequestModel?.gender ?? "";
    final dateOfBirth = cubit.selectedDate;

    if (firstName.isEmpty) {
      ToastUtils.showToast(message: "الاسم الأول مطلوب");
      return;
    }
    if (lastName.isEmpty) {
      ToastUtils.showToast(message: "اسم العائلة مطلوب");
      return;
    }
    if (dateOfBirth == null) {
      ToastUtils.showToast(message: "تاريخ الميلاد مطلوب");
      return;
    }
    if (height.isEmpty) {
      ToastUtils.showToast(message: "الطول مطلوب");
      return;
    }
    if (weight.isEmpty) {
      ToastUtils.showToast(message: "الوزن مطلوب");
      return;
    }
    if (gender.isEmpty) {
      ToastUtils.showToast(message: "الجنس مطلوب");
      return;
    }

    // Update cubit model
    cubit.childRequestModel = ChildRequestModel(
      firstName: firstName,
      lastName: lastName,
      dateOfBirth: cubit.convertDateString(dateOfBirth),
      gender: gender,
      height: double.tryParse(height) ?? 0.0,
      weight: double.tryParse(weight) ?? 0.0,
    );
    cubit.addNewChild();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ChildInformationCubit>();
    return BlocListener<ChildInformationCubit, ChildInformationState>(
      listener: (context, state) {
        if (state is ChildInformationSuccessState) {
          NavigationManager.replaceAll(
              BottomNavBarScreen.id,
          );
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Center(
            child: CustomScrollView(
              slivers: [
                spaceBetweenWidget(height: 8),
                const TextTopScreenChildInfo(),
                spaceBetweenWidget(),
                const SliverToBoxAdapter(child: ImageChildSection()),
                spaceBetweenWidget(height: 24),
                textCenterChildInfo(context: context),
                spaceBetweenWidget(),
                SliverToBoxAdapter(
                  child: NameFieldSignUp(
                    hintText: LocaleKeys.enterYourName.tr(),
                    title: LocaleKeys.firstName.tr(),
                    onChanged: (v) {
                      final old = cubit.childRequestModel;
                      cubit.childRequestModel = ChildRequestModel(
                        firstName: v,
                        lastName: old?.lastName,
                        dateOfBirth: old?.dateOfBirth,
                        gender: old?.gender,
                        height: old?.height,
                        weight: old?.weight,
                      );
                      _firstNameController.text = v;
                    },
                  ),
                ),
                spaceBetweenWidget(),
                SliverToBoxAdapter(
                  child: NameFieldSignUp(
                    hintText: LocaleKeys.enterYourName.tr(),
                    title: LocaleKeys.LastName.tr(),
                    onChanged: (v) {
                      final old = cubit.childRequestModel;
                      cubit.childRequestModel = ChildRequestModel(
                        firstName: old?.firstName,
                        lastName: v,
                        dateOfBirth: old?.dateOfBirth,
                        gender: old?.gender,
                        height: old?.height,
                        weight: old?.weight,
                      );
                      _lastNameController.text = v;
                    },
                  ),
                ),
                spaceBetweenWidget(),
                const BirthDateSection(),
                spaceBetweenWidget(),
                SliverToBoxAdapter(
                  child: CustomTextField(
                    hintText: LocaleKeys.height.tr(),
                    title: LocaleKeys.height.tr(),
                    controller: _heightController,
                    keyboardType: TextInputType.number,
                    onChanged: (v) {
                      final old = cubit.childRequestModel;
                      cubit.childRequestModel = ChildRequestModel(
                        firstName: old?.firstName,
                        lastName: old?.lastName,
                        dateOfBirth: old?.dateOfBirth,
                        gender: old?.gender,
                        height: double.tryParse(v) ?? 0.0,
                        weight: old?.weight,
                      );
                    },
                  ),
                ),
                spaceBetweenWidget(),
                SliverToBoxAdapter(
                  child: CustomTextField(
                    hintText: LocaleKeys.weight.tr(),
                    title: LocaleKeys.weight.tr(),
                    controller: _weightController,
                    keyboardType: TextInputType.number,
                    onChanged: (v) {
                      final old = cubit.childRequestModel;
                      cubit.childRequestModel = ChildRequestModel(
                        firstName: old?.firstName,
                        lastName: old?.lastName,
                        dateOfBirth: old?.dateOfBirth,
                        gender: old?.gender,
                        height: old?.height,
                        weight: double.tryParse(v) ?? 0.0,
                      );
                    },
                  ),
                ),
                spaceBetweenWidget(),
                const GenderSection(),
                spaceBetweenWidget(),
                SliverToBoxAdapter(
                  child: CustomElevatedButton(
                    onPress: () => _onRegisterPressed(context),
                    titleButton: LocaleKeys.register.tr(),
                  ),
                ),
                spaceBetweenWidget(),
              ],
            )),
      ),
    );
  }

  Widget spaceBetweenWidget({double? height, double? width}) {
    return SliverToBoxAdapter(
        child: SizedBox(height: height ?? 16, width: width ?? 0));
  }

  Widget textCenterChildInfo({required BuildContext context}) {
    return SliverToBoxAdapter(
      child: Align(
        alignment: context.locale.languageCode == 'ar '
            ? Alignment.centerRight
            : Alignment.centerLeft,
        child: GText(
          color: AppColors.primaryColor,
          content: LocaleKeys.registerChildData.tr(),
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
