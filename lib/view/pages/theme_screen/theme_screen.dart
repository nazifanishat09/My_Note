import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:get/get.dart';

import '../../../controller/theme_controller/theme_controller.dart';


class ThemeScreen extends StatelessWidget {
  const ThemeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ThemeController>();

    return Scaffold(
      appBar: AppBar(
        title:  Text('Theme'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Choose Theme',
              style: TextStyle(
                fontSize: 22.sp,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 6.h),

            Text(
              'Select how My Note should look.',
              style: TextStyle(
                fontSize: 14.sp,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),

            SizedBox(height: 20.h),

            Obx(
                  () => Card(
                child: Column(
                  children: [
                    _ThemeOption(
                      title: 'System Default',
                      subtitle: 'Use your device theme',
                      value: ThemeMode.system,
                      selectedTheme: controller.themeMode.value,
                      onChanged: controller.changeTheme,
                    ),

                    _ThemeOption(
                      title: 'Light',
                      subtitle: 'Always use light theme',
                      value: ThemeMode.light,
                      selectedTheme: controller.themeMode.value,
                      onChanged: controller.changeTheme,
                    ),

                    _ThemeOption(
                      title: 'Dark',
                      subtitle: 'Always use dark theme',
                      value: ThemeMode.dark,
                      selectedTheme: controller.themeMode.value,
                      onChanged: controller.changeTheme,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ThemeOption extends StatelessWidget {
  final String title;
  final String subtitle;
  final ThemeMode value;
  final ThemeMode selectedTheme;
  final ValueChanged<ThemeMode> onChanged;

  const _ThemeOption({
    required this.title,
    required this.subtitle,
    required this.value,
    required this.selectedTheme,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return RadioListTile<ThemeMode>(
      value: value,
      groupValue: selectedTheme,
      title: Text(title),
      subtitle: Text(subtitle),
      activeColor: Theme.of(context).colorScheme.primary,
      onChanged: (value) {
        if (value != null) {
          onChanged(value);
        }
      },
    );
  }
}