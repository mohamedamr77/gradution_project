import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gradutionproject/core/utils/extentions/screen_size.dart';
import '../../../../../core/utils/app_colors.dart';

class OTPTextFormField extends StatelessWidget {
  const OTPTextFormField({super.key, required this.controller});
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 0.09.h,
      width: 0.17.w,
      child: TextFormField(
        obscureText: true,
        obscuringCharacter: "*",
        controller: controller,
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
        keyboardType: TextInputType.number,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly
        ],
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Theme.of(context).textTheme.displayLarge!.color!,
          fontSize: 14,
          fontWeight: FontWeight.w400,
          fontFamily: "Monserat",
        ),
        decoration: InputDecoration(
          contentPadding:
              EdgeInsets.only(top: 0.025.h, left: 0.05.w, right: 0.05.w),
          fillColor: Theme.of(context).cardColor,
          // Other decoration properties...
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(0.03.w), // Set border radius
            borderSide: BorderSide(
                color: AppColors.thirdColor,
                width: 0.003.w
            ),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(0.03.w),
              borderSide: const BorderSide(color: Colors.grey)),
        ),
      ),
    );
  }
}
