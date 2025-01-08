import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/shared_widget/global_text.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_icons.dart';

class NotificationItem extends StatelessWidget {
  final String title;
  final String subTitle;
  final void Function()? onTapCard;
  final void Function()? onTapIconRemove;
  const NotificationItem(
      {super.key,
      required this.title,
      required this.subTitle,
      this.onTapCard,
      this.onTapIconRemove});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Stack(
        children: [
          Card(
            color: AppColors.lightGrayColor,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20, top: 10),
              child: ListTile(
                onTap: onTapCard,
                trailing: CircleAvatar(
                  backgroundColor: AppColors.lightGrayColor5,
                  child: SvgPicture.asset(AppIcons.injectionIcon),
                ),
                title: GText(
                  color: AppColors.darkBlueColor,
                  content: title,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                subtitle: GText(
                  color: AppColors.grayColor1,
                  content: subTitle,
                  fontSize: 13,
                ),
              ),
            ),
          ),
          Positioned(
              bottom: 2,
              left: 10,
              child: IconButton(
                  onPressed: onTapIconRemove,
                  icon: SvgPicture.asset(AppIcons.removeIcon)))
        ],
      ),
    );
  }
}
