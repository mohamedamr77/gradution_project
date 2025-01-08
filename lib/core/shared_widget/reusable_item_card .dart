import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradutionproject/core/utils/app_icons.dart';
import 'package:gradutionproject/core/utils/extentions/screen_size.dart';
import '../shared_model/resuable_model.dart';
import 'global_text.dart';
import '../utils/app_colors.dart';
import '../utils/app_text.dart';

class ReusableItemCard extends StatelessWidget {
  final ReusableModel reusableModel;
  const ReusableItemCard(
      {super.key,
       required this.reusableModel,
      });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: reusableModel.onTapCard,
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
                    image: AssetImage(reusableModel.imagePath),
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
                        child: GText(
                          color: AppColors.blackColor,
                          content: reusableModel.title,
                          fontSize: 16,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      SizedBox(
                        width: 0.5.w,
                        child: GText(
                          color: AppColors.primaryColor,
                          content: reusableModel.description,
                          fontSize: 14,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Visibility(
                        visible: reusableModel.isDoctor == false,
                        child: SizedBox(
                          width: 0.5.w,
                          child: GText(
                            textAlign: TextAlign.right,
                            color: AppColors.grayColor1,
                            content: reusableModel.subDescription,
                            fontSize: 14,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Visibility(
                        visible: reusableModel.isDoctor,
                        child: SizedBox(
                          width: 0.5.w,
                          child: Row(
                            textDirection: TextDirection.rtl,
                            children: [
                              const Icon(
                                Icons.star,
                                color: Color(0xffFFD90F),
                              ),
                              const SizedBox(
                                width: 6,
                              ),
                              GText(
                                  color: AppColors.blackColor,
                                  content: "${reusableModel.isRating}",
                                  fontSize: 15)
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Visibility(
            visible: reusableModel.isVaccineTimes == false,
            child: Positioned(
              left: 8,
              child: IconButton(
                onPressed: reusableModel.onPressedIconFavourite,
                icon: reusableModel.isFavourite
                    ? const Icon(
                        Icons.favorite,
                        color: AppColors.primaryColor,
                      )
                    : const Icon(
                        Icons.favorite_border_outlined,
                        color: AppColors.primaryColor,
                      ),
              ),
            ),
          ),
          Visibility(
            visible: reusableModel.isVaccineTimes,
            child: Positioned(
                left: 10,
                top: 10,
                child: IconButton(
                    onPressed: reusableModel.onTapCheckBoxVaccineTimes,
                    icon: reusableModel.isCheckBoxTrue
                        ? SvgPicture.asset(AppIcons.checkBoxCorrect)
                        : SvgPicture.asset(AppIcons.checkBoxEmpty))),
          ),
          Visibility(
            visible: reusableModel.isDetails == false,
            child: Positioned(
              bottom: -8,
              left: 8,
              child: TextButton(
                  onPressed: () {},
                  child: const GText(
                      color: AppColors.primaryColor,
                      content: AppText.knowMore,
                      fontSize: 12)),
            ),
          )
        ],
      ),
    );
  }
}
