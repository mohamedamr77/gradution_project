import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradutionproject/core/shared_widget/custom_elevated_btn.dart';
import 'package:gradutionproject/core/utils/locale_keys.g.dart';
import 'package:gradutionproject/features/language_app/presentation/viewModel/language_app_cubit.dart';
import 'package:gradutionproject/features/language_app/presentation/viewModel/language_app_state.dart';
import '../../../../../core/shared_widget/custom_continer_check.dart';

class LanguageBody extends StatefulWidget {
  const LanguageBody({super.key});

  @override
  State<LanguageBody> createState() => _LanguageBodyState();
}

class _LanguageBodyState extends State<LanguageBody> {
  @override
  Widget build(BuildContext context) {
    // Get the current locale
    final isArabic = context.locale.languageCode == 'ar';

    return BlocBuilder<LanguageAppCubit, LanguageAppState>(
      builder: (context, state) {
        return Center(
          child: Column(
            children: [
              const Spacer(flex: 3),
              CustomContainerCheck(
                isCheck: isArabic, // Check if current language is Arabic
                title: LocaleKeys.arabicLanguage.tr(),
                onTap: () {
                  context.setLocale(const Locale('ar'));
                },
              ),
              const Spacer(),
              CustomContainerCheck(
                isCheck: !isArabic, // Check if current language is English
                title: LocaleKeys.englishLanguage.tr(),
                onTap: () {
                  context.setLocale(const Locale('en'));
                },
              ),
              const Spacer(flex: 3),
              CustomElevatedButton(
                onPress: () {
                  // Toggle language between Arabic and English
                  context.setLocale(isArabic ? const Locale('en') : const Locale('ar'));
                },
                titleButton: LocaleKeys.change.tr(),
              ),
              const Spacer(flex: 5),
            ],
          ),
        );
      },
    );
  }
}