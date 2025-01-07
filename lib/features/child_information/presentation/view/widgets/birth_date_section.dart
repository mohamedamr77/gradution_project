import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradutionproject/core/utils/app_icons.dart';
import 'package:gradutionproject/core/utils/extentions/screen_size.dart';
import 'package:gradutionproject/features/child_information/presentation/view_model/child_information_state.dart';
import 'package:gradutionproject/features/child_information/presentation/view_model/child_informtion_cubit.dart';
import '../../../../../core/shared_widget/global_text.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text.dart';

class BirthDateSection extends StatelessWidget {
  const BirthDateSection({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<ChildInformationCubit>(context);
    return BlocBuilder<ChildInformationCubit, ChildInformationState>(
      builder: (context, state) {
        return SliverToBoxAdapter(
          child: Column(
            children: [
              const Align(
                alignment: Alignment.centerRight,
                child: GText(
                  color: AppColors.thirdColor,
                  content: AppText.birthDate,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              GestureDetector(
                onTap: () async {
                  cubit.updateSelectedDate(
                      await showDateChild(context: context, cubit: cubit));
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 11),
                  width: double.infinity,
                  height: 0.07.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: AppColors.thirdColor,
                      )),
                  child: Row(
                    textDirection: TextDirection.rtl,
                    children: [
                      AppIcons.dateIcon,
                      const SizedBox(width: 8),
                      GText(
                        fontSize: 16,
                        color: AppColors.thirdColor,
                        content: cubit.selectedDate == null
                            ? AppText.enterBirthDate
                            : cubit.convertDateString(cubit.selectedDate!),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

Future<DateTime?> showDateChild({
  required BuildContext context,
  required ChildInformationCubit cubit,
}) async {
  return await showDatePicker(
    context: context,
    initialDate: cubit.selectedDate != null
        ? DateTime.parse(cubit.selectedDate.toString())
        : DateTime.now(),
    firstDate: cubit.firstDate,
    lastDate: cubit.lastDate,
    builder: (BuildContext context, Widget? child) {
      return Theme(
        data: _buildDatePickerTheme(context),
        child: child!,
      );
    },
  );
}

/// ToDo : Builds a custom theme for the date picker dialog.
ThemeData _buildDatePickerTheme(BuildContext context) {
  return Theme.of(context).copyWith(
    colorScheme: const ColorScheme.light(
      primary: AppColors.primaryColor, // Header background color.
      onPrimary: AppColors.whiteColor, // Header text color.
      onSurface: AppColors.blackColor, // Body text color.
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.primaryColor, // Button text color.
      ),
    ),
  );
}
