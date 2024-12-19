import 'package:flutter/material.dart';

import '../utils/font_size_responsize.dart';


// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.minLine = 1,
    this.maxLine = 1,
    this.onChanged,
    this.validator,
    this.initialValue,
    this.border,
    this.enabledBorder,
    this.focusBorder,
    this.suffixIcon,
    required this.hintText,
    this.fillColor,
    this.prefix,
    this.obscureText = false,
    this.keyboardType,
    this.controller,
    this.onSaved,
  });

  final String hintText;
  final Widget? prefix;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final Color? fillColor;
  final int minLine;
  final int maxLine;
  final void Function(String)? onChanged;
  final String? initialValue;
  final Widget? suffixIcon;
  final bool obscureText;
  final InputBorder? border;
  final InputBorder? enabledBorder;
  final InputBorder? focusBorder;
  final TextEditingController? controller;
  final void Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: TextFormField(
          textDirection: TextDirection.rtl,
          onSaved: onSaved,
          controller: controller,
          obscureText: obscureText,
          obscuringCharacter: "*",
          initialValue: initialValue,
          onChanged: onChanged,
          validator: validator,
          keyboardType: keyboardType,
          maxLines: maxLine,
          minLines: minLine,
          onTapOutside: (e) {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          style: TextStyle(
            // color: AppColor.kPrimaryColor,
            fontSize: getResponsiveFontSize(context: context, fontSize: 16),
            fontWeight: FontWeight.w400,
            // fontFamily: FontFamilyApp.almarai,
          ),
          decoration: InputDecoration(
            hintTextDirection: TextDirection.rtl,
            fillColor: fillColor ?? const Color(0xffFAFAFA),
            hintText: hintText,
            // hintStyle: TextStyle(
            //     color: AppColors.kPrimaryColor,
            //     fontSize: getResponsiveFontSize(context: context, fontSize: 16),
            //     fontWeight: FontWeight.w400,
            //     fontFamily: FontFamilyApp.almarai,
            //     ),
            border: const OutlineInputBorder(),
            prefixIcon: prefix,
            suffixIcon: suffixIcon,
            // focusedBorder: focusBorder ??
            //      const OutlineInputBorder(
            //        borderSide: BorderSide(width: 1, color: AppColors.kPrimaryColor),
            //      ),
            // enabledBorder: enabledBorder ??
            //      const OutlineInputBorder(
            //         borderSide: BorderSide(width: 1, color: AppColors.kPrimaryColor),
            //      )
          ),
        ),
      ),
    );
  }
}
