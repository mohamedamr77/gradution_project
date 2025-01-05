import 'package:flutter/material.dart';
import 'package:gradutionproject/core/utils/extentions/screen_size.dart';

import '../../../../../core/shared_widget/global_text.dart';

class FeatureHomeWidget extends StatelessWidget {
  final String imagePath;
  final String title;
  final void Function()? onTap;

  const FeatureHomeWidget(
      {super.key, required this.imagePath, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Image(
            image: AssetImage(
              imagePath,
            ),
            width: 0.4.w,
            height: 0.2.h,
            fit: BoxFit.fill,
          ),
          const SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: GText(
              color: const Color(0xff000099),
              content: title,
              fontSize: 16,
              fontWeight: FontWeight.w500,
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    ));
  }
}
