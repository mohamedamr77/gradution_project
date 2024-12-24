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
         padding: EdgeInsets.only(top: 0.01.h),
        decoration:  const BoxDecoration(
          color: AppColors.skyBlueColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
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
                icon: AnimatedBuilder(
                  animation: Listenable.merge([controller!]),
                  builder: (context, _) {
                    // Check if the current item is selected
                    final isActive = localIndex == index;

                    return Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.center,
                      children: [
                        AnimatedPositioned(
                          duration: const Duration(milliseconds: 300),
                          top: isActive ? -40 : 0, // Active item moves upward
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                            width: isActive ? 50 : 0, // Circle appears only for active item
                            height: isActive ? 50 : 0,
                            decoration: BoxDecoration(
                              color: isActive ?  AppColors.darkBlueAccent : Colors.transparent,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          transform: Matrix4.translationValues(
                            0,
                            isActive ? -25 : 0, // Icon moves upward when active
                            0,
                          ),
                          child: isActive
                              ? bottomNavIconsList[index].iconSelected
                              : bottomNavIconsList[index].iconUnSelected,
                        ),
                      ],
                    );
                  },
                ),
                label: "",
              ),
            ),

          ),
        )

      ),
    );
  }
}