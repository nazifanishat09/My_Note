import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:noteapp/controller/appData/appData.dart';
import 'package:noteapp/controller/auth_controller/auth.dart';
import 'package:noteapp/view/pages/auth/signInPage/sign_in_page.dart';
import 'package:noteapp/view/pages/auth/signUp/signUp.dart';
import 'package:noteapp/view/pages/auth/widgets/tapBer.dart';
import 'package:noteapp/view/widgets/customText.dart';


class AuthScreen extends StatelessWidget {
  AuthScreen({super.key});
  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Center(child: Image.asset("assets/logo.png", height: 70.h)),
                SizedBox(height: 10.h),
                CustomTextWidget(
                  title: 'Create Your Account',
                  fontS: 25.sp,
                  fontW: FontWeight.w700,
                ),
                SizedBox(height: 10.h),
                CustomTextWidget(
                  title: "Start organizing your thoughts with beautiful notes",
                  fontS: 17,
                  textAlign: TextAlign.center,
                  textColor: greyColor,
                ),
                SizedBox(height: 30.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  children: [
                    TapBerWidgets(title: 'Sign In', isTab: false),
                    TapBerWidgets(title: 'Sign Up', isTab: true),
                  ],
                ),  SizedBox(height: 10.h),
               SignInPage()
               // SignUpScreen()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
