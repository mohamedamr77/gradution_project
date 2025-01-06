import 'package:flutter/material.dart';
import 'package:gradutionproject/core/navigation/navigation_manager.dart';
import 'package:gradutionproject/core/shared_widget/global_text.dart';
import 'package:gradutionproject/core/utils/app_colors.dart';
import 'package:gradutionproject/core/utils/app_icons.dart';
import 'package:gradutionproject/core/utils/app_text.dart';
import 'package:gradutionproject/core/utils/extentions/screen_size.dart';

class FavouriteBody extends StatelessWidget {
  const FavouriteBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 0.04.w,vertical: 0.02.h ),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: SizedBox(height: 16,)),
          SliverToBoxAdapter(
            child: SizedBox(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,  // Enable horizontal scrolling
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                      2, (index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8), // Add padding between items
                      child: Container(
                        width: 0.42.w,
                        padding: EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: GText(
                            color: AppColors.whiteColor,
                            content: AppText.doctors,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
          )

        ],
      )
    );
  }
}
