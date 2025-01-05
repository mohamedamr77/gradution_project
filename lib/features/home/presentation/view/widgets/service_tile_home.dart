import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradutionproject/core/shared_widget/global_text.dart';

class ServiceTile extends StatelessWidget {
  final void Function()? onTap;
  final String imagePath;
  final String title;

  const ServiceTile({super.key, this.onTap, required this.imagePath, required this.title});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color:const Color(0xff808080).withOpacity(0.9),
            ),
          ),
          child: Row(
            children: [
              SvgPicture.asset(imagePath),
              const SizedBox(width: 8),
              Expanded(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: GText(
                    color: const Color(0xff808080),
                    content: title,
                    fontSize: 9,

                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}