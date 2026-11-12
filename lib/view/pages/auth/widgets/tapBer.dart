import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:get/get.dart';

import '../../../../../controller/appData/appData.dart';
import '../../../../../controller/auth_controller/auth.dart';
import '../../../widgets/customText.dart';


class TapBerWidgets extends StatelessWidget {
  final String title;
  final bool isTab;
 TapBerWidgets({super.key, required this.title, required this.isTab});
  final AuthController authController = Get.find<AuthController>();


  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: InkWell(onTap: () {
        authController.isTab.value = isTab;
      },
        child: Column(
          spacing: 5.h,
          children: [
            CustomTextWidget(
              title: title,
              fontS: 20.sp,
            ),
            Obx(
                  () => Container(
                height: 3,
                width: MediaQuery.sizeOf(context).width / 2,
                decoration: BoxDecoration(
                  color: authController.isTab.value==isTab
                      ? primaryColor
                      : greyColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
