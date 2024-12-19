import 'package:flutter/material.dart';
import 'package:gradutionproject/core/utils/extentions/screen_size.dart';

class ImageOnBoarding extends StatefulWidget {
  final String imagePath;
  const ImageOnBoarding({super.key, required this.imagePath});

  @override
  State<ImageOnBoarding> createState() => _ImageOnBoardingState();
}

class _ImageOnBoardingState extends State<ImageOnBoarding> {

  bool reverse = false;
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween:
      reverse ?
      Tween<double>(begin: 0.95, end: 1) :
      Tween<double>(begin: 1, end: 0.95),
      duration: const Duration(seconds: 1),
      onEnd: (){
        setState(() {
          reverse = !reverse;
        });
      },
      child: Image(
        image:  AssetImage(
          widget.imagePath,
        ),
        width: double.infinity,
        height: 0.34.h,
        fit: BoxFit.fill,
      ),
      builder: (BuildContext context,  value, Widget? child) {
        return  Transform.scale(
          scale: value,
          child: child,
        );
      },

    );
  }
}