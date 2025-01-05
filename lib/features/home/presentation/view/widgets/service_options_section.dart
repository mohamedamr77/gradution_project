import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradutionproject/core/shared_widget/global_text.dart';
import 'package:gradutionproject/core/utils/app_colors.dart';
import 'package:gradutionproject/core/utils/app_icons.dart';
import 'package:gradutionproject/core/utils/app_images.dart';
import 'package:gradutionproject/core/utils/app_text.dart';
import 'package:gradutionproject/core/utils/extentions/screen_size.dart';
import 'package:gradutionproject/features/home/presentation/view/widgets/service_options_section.dart';
import 'package:gradutionproject/features/home/presentation/view/widgets/service_tile_home.dart';
import 'package:hive/hive.dart';
class ServiceOptionsSection extends StatelessWidget {
  const ServiceOptionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        ServiceTile(imagePath: AppIcons.chatIcon, title:  AppText.geminiAnswerPrompt,onTap: () {},),
        const SizedBox(width: 16),
        ServiceTile(imagePath: AppIcons.mapIcon, title: AppText.nearbyPharmacies,onTap: () {},),
      ],
    );
  }
}

