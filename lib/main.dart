import 'package:flutter/material.dart';
import 'package:gradutionproject/core/utils/app_colors.dart';
import 'package:gradutionproject/core/utils/const_box.dart';
import 'package:gradutionproject/core/utils/const_variables.dart';
import 'package:hive_flutter/adapters.dart';
import 'core/navigation/navigation_manager.dart';
import 'core/navigation/routes.dart';
import 'package:easy_localization/easy_localization.dart';

import 'features/bottom_nav_bar/presentation/view/bottom_nav_bar_screen.dart';
import 'features/gemini_health/presentation/view/gemini_health_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await _initializeHive();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
   EasyLocalization(
       supportedLocales: const [
         Locale('ar'), // Arabic
         Locale('en'), // English
       ],
       path: 'assets/translations', // Path to translation files
       fallbackLocale: const Locale('en'), // Fallback language
       startLocale: const Locale('en'),
       child: const MyApp()),
  );
}

Future<void> _initializeHive() async {
  await Hive.initFlutter();
  // Open Hive boxes
  await Future.wait([
    Hive.openBox(BoxApp.kThemeBox),
    Hive.openBox(BoxApp.kAuthBox),

  ]);
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
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            theme: ThemeData(
                appBarTheme: const AppBarTheme(
                  elevation: 0,
                  backgroundColor: AppColors.lightGrayColor,
                ),
                scaffoldBackgroundColor: AppColors.lightGrayColor),
            debugShowCheckedModeBanner: false,
            navigatorKey: NavigationManager.navigationKey,
            routes: AppRouter.routes,
            initialRoute:
            BottomNavBarScreen.id,
            // TokenManager.getToken() == null
            //     ? OnBoardingScreen.id
            //     : BottomNavBarScreen.id,

          ),
        );
      },
    );
  }
}
/*
 figma design : https://www.figma.com/design/czbVQjVTpoIqZykFmJbbEw/Graduation-project?node-id=0-1&t=JoLDrBqo2gQts2lD-1
 */
