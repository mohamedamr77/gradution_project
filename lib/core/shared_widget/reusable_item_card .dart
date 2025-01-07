import 'package:flutter/material.dart';
import 'package:gradutionproject/core/utils/extentions/screen_size.dart';
import 'global_text.dart';
import '../utils/app_colors.dart';
import '../utils/app_text.dart';

class ReusableItemCard  extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final String subDescription;
  final  void Function() onPressedIconFavourite;
  final Function() onTapCard;
  final bool isDoctor;
  final double isRating;
  const ReusableItemCard ({super.key, required this.imagePath, required this.title, required this.description, required this.subDescription, required this.onPressedIconFavourite,required this.onTapCard,  this.isDoctor =false,  this.isRating =0});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapCard,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.secondaryColor,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: Row(
                textDirection: TextDirection.rtl,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image(
                    image:  AssetImage(imagePath),
                    width: 0.28.w,
                    height: 0.12.h,
                    fit: BoxFit.fill,
                  ),
                  const SizedBox(
                    width: 14,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: 0.5.w,
                        child:  GText(
                          color: AppColors.blackColor,
                          content:
                          title,
                          fontSize: 16,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 8,),
                      SizedBox(
                        width: 0.5.w,
                        child:  GText(
                          color: AppColors.primaryColor,
                          content:
                           description,
                          fontSize: 14,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 4,),
                       Visibility(
                         visible: isDoctor ==false,
                         child: GText(
                          textAlign: TextAlign.right,
                          color: AppColors.grayColor1,
                          content:
                          subDescription,
                          fontSize: 14,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.w400,
                                               ),
                       ),
                        Visibility(
                          visible: isDoctor,
                          child: Row(
                            textDirection: TextDirection.rtl,
                            children: [
                              const Icon(Icons.star, color: Color(0xffFFD90F),),
                              const SizedBox(width: 6,),
                              GText(color: AppColors.blackColor, content: "$isRating", fontSize: 15)
                            ],
                          ),
                        )

                    ],
                  )
                ],
              ),
            ),
          ),
          IconButton(
            onPressed: onPressedIconFavourite,
            icon: const Icon(Icons.favorite,color: AppColors.primaryColor,),
          ),
          Positioned(
            bottom: -8,
            left: 8,
            child: TextButton(onPressed: () {}, child: const GText(color: AppColors.primaryColor, content: AppText.knowMore, fontSize: 12)),
          )
        ],
      ),
    );
  }
}
