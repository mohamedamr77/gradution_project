import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradutionproject/core/utils/app_icons.dart';
import 'package:gradutionproject/core/utils/app_images.dart';
import 'package:gradutionproject/core/utils/extentions/screen_size.dart';
import '../shared_model/resuable_model.dart';
import '../utils/locale_keys.g.dart';
import 'global_text.dart';
import '../utils/app_colors.dart';
import '../utils/app_text.dart';
import 'dart:ui' as ui;
class ReusableItemCard extends StatelessWidget {
  final ReusableModel reusableModel;
  const ReusableItemCard({
    super.key,
    required this.reusableModel,
  });

  @override
  Widget build(BuildContext context) {
    final isArabic = context.locale.languageCode == 'ar';
    final textDirection = isArabic ? ui.TextDirection.rtl : ui.TextDirection.ltr;
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
                children: [
                  CustomImageNetwork(reusableModel: reusableModel),
                  const SizedBox(
                    width: 14,
                  ),
                  Column(

                    children: [
                      SizedBox(
                        width: 0.5.w,
                        child: GText(
                          color: AppColors.blackColor,
                          content: reusableModel.title,
                          fontSize: 16,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: isArabic ? TextAlign.right : TextAlign.left,
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
                          textAlign: isArabic ? TextAlign.right : TextAlign.left,
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
                        child: IsDoctorRate(reusableModel: reusableModel,),
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
              left: isArabic ?  10 :null,
              right: isArabic ? null : 10,
              child: FavIcon(reusableModel: reusableModel,)
            ),
          ),
          Visibility(
            visible: reusableModel.isVaccineTimes,
            child: Positioned(
                left: isArabic ?  10 :null,
                right: isArabic ? null : 10,
                top: 10,
                child: CheckBoxIcon(reusableModel: reusableModel,)
            ),
          ),
          Visibility(
            visible: reusableModel.isDetails == false,
            child: Positioned(
              bottom: -8,
              left: isArabic ?  8 :null,
              right: isArabic ? null : 8,
              child:  ReadMore(reusableModel: reusableModel,)
            ),
          )
        ],
      ),
    );
  }
}


class IsDoctorRate extends StatelessWidget {
  final ReusableModel reusableModel;

  const IsDoctorRate({super.key, required this.reusableModel});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 0.5.w,
      child: Row(
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
    );
  }
}


class CustomImageNetwork extends StatelessWidget {
  final ReusableModel reusableModel;

  const CustomImageNetwork({super.key, required this.reusableModel});

  @override
  Widget build(BuildContext context) {
    return  ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: CachedNetworkImage(
        imageUrl: reusableModel.imagePath,
        errorWidget: (_, __, ___) => Image.asset(
          AppImages.adviceHomeImage,
          width: 0.28.w,
          height: 0.12.h,
          fit: BoxFit.fill,
        ),
        width: 0.28.w,
        height: 0.12.h,
        fit: BoxFit.fill,
      ),
    );
  }
}



class ReadMore extends StatelessWidget {
  final ReusableModel reusableModel;

  const ReadMore({super.key, required this.reusableModel});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {},
        child: GText(
            color: AppColors.primaryColor,
            content: LocaleKeys.knowMore.tr(),
            fontSize: 12));
  }
}

class CheckBoxIcon extends StatelessWidget {
  final ReusableModel reusableModel;

  const CheckBoxIcon({super.key, required this.reusableModel});

  @override
  Widget build(BuildContext context) {
    return  IconButton(
        onPressed: reusableModel.onTapCheckBoxVaccineTimes,
        icon: reusableModel.isCheckBoxTrue
            ? SvgPicture.asset(AppIcons.checkBoxCorrect)
            : SvgPicture.asset(AppIcons.checkBoxEmpty));
  }
}



class FavIcon extends StatelessWidget {
  final ReusableModel reusableModel;
  const FavIcon({super.key, required this.reusableModel});

  @override
  Widget build(BuildContext context) {
    return IconButton(
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
    );
  }
}
