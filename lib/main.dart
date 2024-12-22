import 'package:flutter/material.dart';
import 'package:gradutionproject/core/utils/app_colors.dart';
import 'package:gradutionproject/core/utils/const_variables.dart';
import 'package:gradutionproject/features/auth/sign_up/presentation/view/sign_up_screen.dart';
import 'package:gradutionproject/features/on_boarding/presentation/view/on_boarding_screen.dart';

import 'core/navigation/navigation_manager.dart';
import 'core/navigation/routes.dart';
import 'features/auth/login/presentation/view/login_screen.dart';

void main (){
  runApp(const MyApp());
}
/*
 runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MyApp(), // Wrap your app
    ),
  );

   useInheritedMediaQuery: true,
          locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,
 */

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        wd = constraints.maxWidth;
        ht = constraints.maxHeight;
      return  SafeArea(
        child: MaterialApp(
          theme: ThemeData(
            scaffoldBackgroundColor: AppColors.lightGrayColor
          ),
          debugShowCheckedModeBanner: false,
          navigatorKey: NavigationManager.navigationKey,
          routes: AppRouter.routes,
          initialRoute:OnBoardingScreen.id,
        ),
      );
      },

    );
  }
}
