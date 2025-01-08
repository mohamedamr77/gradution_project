import 'package:flutter/material.dart';
import 'package:gradutionproject/core/utils/app_colors.dart';
import 'package:gradutionproject/core/utils/const_variables.dart';
import 'package:gradutionproject/features/bottom_nav_bar/presentation/view/bottom_nav_bar_screen.dart';
import 'core/navigation/navigation_manager.dart';
import 'core/navigation/routes.dart';
import 'features/notification_feature/presentation/view/notification_details_screen.dart';

void main() {
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
        return SafeArea(
          child: MaterialApp(
            theme: ThemeData(
                appBarTheme: const AppBarTheme(
                  elevation: 0,
                  backgroundColor: AppColors.lightGrayColor,
                ),
                scaffoldBackgroundColor: AppColors.lightGrayColor),
            debugShowCheckedModeBanner: false,
            navigatorKey: NavigationManager.navigationKey,
            routes: AppRouter.routes,
            initialRoute: NotificationDetailsScreen.id,
          ),
        );
      },
    );
  }
}
/*
 figma design : https://www.figma.com/design/czbVQjVTpoIqZykFmJbbEw/Graduation-project?node-id=0-1&t=JoLDrBqo2gQts2lD-1
 */
