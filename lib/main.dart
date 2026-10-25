import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:get/get.dart';
import 'package:noteapp/theme/apptheme.dart';
import 'package:noteapp/view/pages/splash_screen/splash_screen.dart';

import 'controller/note_controller/note_controller.dart';
import 'controller/theme_controller/theme_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Get.put(ThemeController());
  Get.put(NoteController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilPlusInit(
      designSize: Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetX<ThemeController>(
          builder: (controller) {
            return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'My Note',

              theme: AppTheme.lightTheme,
              darkTheme: AppTheme.darkTheme,
              themeMode: controller.themeMode.value,

              home:  SplashScreen(),
            );
          },
        );
      },
    );
  }
}