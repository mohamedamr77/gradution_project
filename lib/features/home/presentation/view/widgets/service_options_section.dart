import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:gradutionproject/core/navigation/navigation_manager.dart';
import 'package:gradutionproject/core/utils/app_icons.dart';
import 'package:gradutionproject/core/utils/locale_keys.g.dart';
import 'package:gradutionproject/features/gemini_health/presentation/view/gemini_health_screen.dart';
import 'package:gradutionproject/features/home/presentation/view/widgets/service_tile_home.dart';

class ServiceOptionsSection extends StatelessWidget {
  const ServiceOptionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ServiceTile(
          imagePath: AppIcons.chatIcon,
          title: LocaleKeys.geminiAnswerPrompt.tr(),
          onTap: () {
            NavigationManager.push(GeminiHealthScreen.id);
          },
        ),
        const SizedBox(width: 16),
        ServiceTile(
          imagePath: AppIcons.mapIcon,
          title: LocaleKeys.nearbyPharmacies.tr(),
          onTap: () {},
        ),
      ],
    );
  }
}
