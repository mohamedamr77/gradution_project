import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:gradutionproject/core/utils/app_colors.dart';
import 'package:gradutionproject/core/utils/app_font_family.dart';
import 'package:gradutionproject/core/utils/app_text.dart';
import 'package:gradutionproject/core/utils/font_size_responsize.dart';

import '../../../../core/shared_widget/global_text.dart';

import 'package:flutter/material.dart';

class TitleOnBoarding extends StatefulWidget {
  const TitleOnBoarding({super.key});

  @override
  _TitleOnBoardingState createState() => _TitleOnBoardingState();
}

class _TitleOnBoardingState extends State<TitleOnBoarding>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _opacityAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn,
      ),
    );

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOutBack,
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Opacity(
          opacity: _opacityAnimation.value,
          child: Transform.scale(
            scale: _scaleAnimation.value,
            child: child,
          ),
        );
      },
      child: const GText(
        textDirection: TextDirection.rtl,
        color: AppColors.primaryColor,
        content: AppText.sideEffectsInfo,
        fontSize: 22,
        fontWeight: FontWeight.w600,
        textAlign: TextAlign.center,
      ),
    );
  }
}

/*
AnimatedTextKit(
      animatedTexts: [
        FadeAnimatedText(
           AppText.sideEffectsInfo,
          textAlign: TextAlign.right,
          textStyle:  TextStyle(
            fontSize: getResponsiveFontSize(context: context, fontSize: 22 ),
            fontWeight: FontWeight.w600,
            color: AppColors.primaryColor,
            fontFamily: AppFontFamily.cairoFontFamily,
          ),
          speed: const Duration(milliseconds: 100),
        ),
      ],
      repeatForever: true,

      displayFullTextOnTap: true,
      stopPauseOnTap: false,
    );
 */