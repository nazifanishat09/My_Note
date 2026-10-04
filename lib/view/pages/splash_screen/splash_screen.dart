import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:get/get.dart';

import '../../../controller/splash_controller/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize Splash Controller
    Get.put(SplashController());

    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // App Logo
              Container(
                width: 100.w,
                height: 100.w,
                decoration: BoxDecoration(
                  color: const Color(0xFF6C4AB6),
                  borderRadius: BorderRadius.circular(25.r),
                ),
                child: Icon(
                  Icons.note_alt_rounded,
                  size: 55.sp,
                  color: Colors.white,
                ),
              ),

              SizedBox(height: 24.h),

              // App Name
              Text(
                'My Note',
                style: TextStyle(
                  fontSize: 30.sp,
                  fontWeight: FontWeight.bold,
                  color: colorScheme.primary,
                ),
              ),

              SizedBox(height: 8.h),

              // Tagline
              Text(
                'Your notes, organized simply.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}