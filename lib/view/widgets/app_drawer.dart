import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:get/get.dart';
import 'package:noteapp/controller/appData/appData.dart';
import 'package:noteapp/view/pages/appInfoPage/app_info_screen.dart';
import 'package:noteapp/view/pages/settingPage/setting_page.dart';

import '../pages/bin_screen/bin_screen.dart';
import '../pages/theme_screen/theme_screen.dart';
import 'app_logo.dart';
import 'drawer_item.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Drawer(
      child: Column(
        children: [

          // Header
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20.w),
            color: primaryColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [ SizedBox(height: 28.h,),
               AppLogo(size: 65),

                SizedBox(height: 14.h),

                Text(
                  appName,
                  style: TextStyle(
                    color: colorScheme.onPrimary,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 4.h),

                Text(
                  'Your notes, organized simply.',
                  style: TextStyle(
                    color: colorScheme.onPrimary.withValues(
                      alpha: 0.75,
                    ),
                    fontSize: 12.sp,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 10.h),

          DrawerItem(
            icon: Icons.settings_outlined,
            title: 'Settings',
            onTap: () {
              Get.to(SettingPage());
            },
          ),

          DrawerItem(
            icon: Icons.delete_outline_rounded,
            title: 'Bin',
            onTap: () {
              Get.to(BinScreen());
            },
          ),


          DrawerItem(
            icon: Icons.dark_mode_outlined,
            title: 'Theme',
            onTap: () {
              Get.to(ThemeScreen());

            },
          ),

          DrawerItem(
            icon: Icons.info_outline_rounded,
            title: 'App Info',
            onTap: () {
              Get.to(AppInfoScreen());
            },
          ),

          const Spacer(),

          Padding(
            padding: EdgeInsets.only(bottom: 20.h),
            child: Text(
              'My Note • v1.0.0',
              style: TextStyle(
                fontSize: 12.sp,
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ),
        ],
      ),
    );
  }
}