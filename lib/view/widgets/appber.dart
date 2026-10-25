import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:noteapp/controller/appData/appData.dart';

class CustomAppBer extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBer({super.key});
  Size get preferredSize => Size.fromHeight(56.h);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: primaryColor,
      title: Text(
        appName,
        style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
      ),
    );
  }
}
