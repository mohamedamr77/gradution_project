import 'package:flutter/material.dart';
import 'package:gradutionproject/core/utils/extentions/screen_size.dart';

import '../../../../../core/shared_widget/global_text.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text.dart';

class BirthDateSection extends StatefulWidget {
  const BirthDateSection({super.key});

  @override
  State<BirthDateSection> createState() => _BirthDateSectionState();
}

class _BirthDateSectionState extends State<BirthDateSection> {

  DateTime dateTimeNow =DateTime.now();
  DateTime? selectedDate;


  String convertDateString(DateTime date){
    return date.toString().split(" ")[0];
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          const Align(
            alignment: Alignment.centerRight,
            child: GText(
              color: AppColors.thirdColor,
              content: AppText.gender,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          GestureDetector(
            onTap: () async{
            selectedDate = await   showDatePicker(
                  context: context,
              initialDate: selectedDate != null
                  ? DateTime.parse(selectedDate.toString())
                  : DateTime.now(),
                  firstDate:dateTimeNow.subtract(const Duration(
                      days: 365 *4
                    )),
                  lastDate: dateTimeNow,
                 builder: (context, child) {
                   return Theme(
                       data: Theme.of(context).copyWith(
                         colorScheme: const ColorScheme.light(
                           primary: AppColors.primaryColor, // header background color
                           onPrimary: AppColors.whiteColor, // header text color
                           onSurface: AppColors.blackColor, // body text color
                         ),
                         textButtonTheme: TextButtonThemeData(
                           style: TextButton.styleFrom(
                             foregroundColor: AppColors.primaryColor, // button text color
                           ),
                         ),
                       ),
                       child: child!);
                 },

            );

            setState(() {

            });
            print(selectedDate.toString());
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 11),
              width: double.infinity,
              height: 0.07.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: AppColors.thirdColor,
                  )),
              child:  Row(
                textDirection: TextDirection.rtl,
                children: [
                  Icon(
                    Icons.date_range,
                    color: AppColors.thirdColor,
                  ),
                  SizedBox(width: 8),
                  GText(
                    fontSize: 16,
                    color: AppColors.thirdColor,
                    content:
                    selectedDate == null ?
                    AppText.enterBirthDate :
                    convertDateString(selectedDate!)
                    ,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
