import 'package:flutter/material.dart';
import 'package:gradutionproject/core/utils/app_icons.dart';
import 'package:gradutionproject/core/utils/app_text.dart';
import 'package:gradutionproject/features/home/presentation/view/widgets/service_tile_home.dart';

class ServiceOptionsSection extends StatelessWidget {
  const ServiceOptionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ServiceTile(
          imagePath: AppIcons.chatIcon,
          title: AppText.geminiAnswerPrompt,
          onTap: () {},
        ),
        const SizedBox(width: 16),
        ServiceTile(
          imagePath: AppIcons.mapIcon,
          title: AppText.nearbyPharmacies,
          onTap: () {},
        ),
      ],
    );
  }
}
