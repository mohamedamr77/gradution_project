import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradutionproject/core/navigation/navigation_manager.dart';
import 'package:gradutionproject/core/shared_widget/custom_elevated_btn.dart';
import 'package:gradutionproject/core/utils/locale_keys.g.dart';
import 'package:gradutionproject/features/bottom_nav_bar/presentation/view/bottom_nav_bar_screen.dart';
import '../../../../../core/shared_widget/custom_continer_check.dart';

class LanguageBody extends StatelessWidget {
  const LanguageBody({super.key});

  @override
  Widget build(BuildContext context) {
    final currentLocale = context.locale;

    return Center(
      child: Column(
        children: [
          const Spacer(flex: 3),
          CustomContainerCheck(
            isCheck :currentLocale.languageCode == 'ar', // Check if current language is Arabic
            title: LocaleKeys.arabicLanguage.tr(),
            onTap: () {
              context.setLocale(const Locale('ar'));
            },
          ),
          const Spacer(),
          CustomContainerCheck(
            isCheck: currentLocale.languageCode == 'en', // Check if current language is English
            title: LocaleKeys.englishLanguage.tr(),
            onTap: () {
              context.setLocale(const Locale('en'));
            },
          ),
          const Spacer(flex: 3),
          CustomElevatedButton(
            onPress: () {
              context.setLocale(currentLocale.languageCode == 'ar' ? const Locale('en') : const Locale('ar'));
              NavigationManager.push(BottomNavBarScreen.id);
            },
            titleButton: LocaleKeys.change.tr(),
          ),
          const Spacer(flex: 5),
        ],
      ),
    );
  }
}