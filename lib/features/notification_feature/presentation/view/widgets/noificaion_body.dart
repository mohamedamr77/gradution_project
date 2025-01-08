import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gradutionproject/core/navigation/navigation_manager.dart';
import 'package:gradutionproject/core/utils/app_images.dart';
import 'package:gradutionproject/core/utils/app_text.dart';

import '../../../../../core/shared_widget/global_text.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_icons.dart';

class NotificationBody extends StatelessWidget {
  const NotificationBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [

      ],
    );
  }
  SliverToBoxAdapter _builderSpacer({required double height}){
    return SliverToBoxAdapter(child: SizedBox(height:  height,));
  }
}
