import 'package:flutter/material.dart';
import 'package:gradutionproject/core/utils/app_colors.dart';
import 'package:gradutionproject/core/utils/extentions/screen_size.dart';
import '../../../account/presentation/view/account_screen.dart';
import '../../../doctors/presentation/view/doctors_screen.dart';
import '../../../home/presentation/view/home_screen.dart';
import '../../../vaccine/presentation/view/vaccine_screen.dart';
import '../../data/model/bottom_nav_icaon_list.dart';

class BottomNavBarScreen extends StatefulWidget {
  static const String id = "BottomNavBarScreen";
  const BottomNavBarScreen({super.key});

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  var navPages = [
    const HomeScreen(),
    const DoctorsScreen(),
    const VaccineScreen(),
    const AccountScreen(),
  ];

  int localIndex = 0;
  PageController? controller;

  @override
  void initState() {
    super.initState();
    controller = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: PageView.builder(
        reverse: true,
          itemCount: navPages.length,
          controller: controller,
          onPageChanged: (val) {
            setState(() {
              localIndex = val;
            });
          },
          itemBuilder: (context, index) {
            return navPages[index];
          },
        ),
      ),
      bottomNavigationBar: Container(
         padding: EdgeInsets.only(top: 0.02.h , bottom: 0.01.h),
        decoration:  const BoxDecoration(
          color: AppColors.skyBlueColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child:Theme(
          data: Theme.of(context).copyWith(
            splashColor: Colors.transparent, // Remove ripple effect
            highlightColor: Colors.transparent, // Remove highlight effect
          ),
          child: BottomNavigationBar(
            currentIndex: localIndex,
            onTap: (index) {
              setState(() {
                localIndex = index;
                controller!.jumpToPage(index);
              });
            },
            backgroundColor: Colors.transparent,
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white.withOpacity(0.75),
            enableFeedback: false,
            items: List.generate(
              navPages.length,
                  (index) => BottomNavigationBarItem(
                icon: bottomNavIconsList[index].iconUnSelected,
                activeIcon: bottomNavIconsList[index].iconSelected,
                label: bottomNavIconsList[index].label,
              ),
            ),
          ),
        )

      ),
    );
  }
}