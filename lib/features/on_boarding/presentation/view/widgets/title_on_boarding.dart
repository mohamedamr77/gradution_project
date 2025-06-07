import 'package:flutter/material.dart';
import 'package:gradutionproject/core/utils/app_colors.dart';

import '../../../../../core/shared_widget/global_text.dart';

class TitleOnBoarding extends StatefulWidget {
  final String title;
  const TitleOnBoarding({super.key, required this.title});

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
      duration: const Duration(seconds: 1),
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
      child: GText(
        color: AppColors.primaryColor,
        content: widget.title,
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
