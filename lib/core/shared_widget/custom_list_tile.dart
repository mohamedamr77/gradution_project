import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradutionproject/core/shared_widget/global_text.dart';
import 'package:gradutionproject/core/utils/app_colors.dart';
import 'package:gradutionproject/core/utils/app_icons.dart';

class CustomListTile extends StatelessWidget {
  final String title;
 final void Function()? onTap;
 final Widget? leading;
  const CustomListTile({super.key, required this.title,required this.onTap,required this.leading});
  @override
  Widget build(BuildContext context) {
    return  Card(
      shadowColor: Colors.transparent,
      color: Color(0xffF4F0F0),
      child: ListTile(
        onTap: onTap,
        title: GText(color: AppColors.darkGrayColor, content: title , fontSize: 18 ,),
        trailing:  Transform.translate(
          offset: const Offset(-12, 0),
          child: Icon(
            Icons.arrow_forward_ios,
            color: AppColors.primaryColor.withOpacity(0.6),
          ),
        ),
        leading: leading,
      ),
    );
  }
}
