import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:huds/core/routes/app_route_pages.dart';
import 'package:huds/features/initial/presentation/screens/splash_screen.dart';

class Huds extends StatelessWidget {
  const Huds({super.key});

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          navigatorKey: Huds.navigatorKey,
          theme: ThemeData(scaffoldBackgroundColor: Colors.white),
          // initialRoute: AppRouteNames().splash,
          getPages: AppRoutePages.appRoutePages(),
          home: SplashScreen(),
        );
      },
    );
  }
}
