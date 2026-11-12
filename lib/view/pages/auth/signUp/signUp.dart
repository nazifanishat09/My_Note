import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';

import '../../../../controller/appData/appData.dart';
import '../../../../controller/auth_controller/formController.dart';
import '../../../widgets/customText.dart';
import '../widgets/customButton.dart';
import '../widgets/customTextFormField.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final formcontroller = Get.put(FormController());

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formcontroller.formKey,
      child: Column(
        children: [
          CustomTextFormField(
            controller: formcontroller.numberController,
            hintText: 'Enter your number',
            prefixIcon: Icons.phone,
            keyboardType: TextInputType.number,

            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(11),
            ],

            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter phone number';
              }

              if (!RegExp(r'^[0-9]{11}$').hasMatch(value)) {
                return 'Enter valid 11 digit number';
              }

              return null;
            },
          ),

          SizedBox(height: 15.h),

          // Email
          CustomTextFormField(
            controller: formcontroller.emailController,
            hintText: 'Enter your email',
            prefixIcon: Icons.email_outlined,
            keyboardType: TextInputType.emailAddress,

            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter email';
              }

              if (!GetUtils.isEmail(value)) {
                return 'Enter valid email';
              }

              return null;
            },
          ),

          const SizedBox(height: 15),

          // Password
          Obx(
            () => CustomTextFormField(
              controller: formcontroller.passwordController,
              hintText: 'Enter your password',
              prefixIcon: Icons.lock_outline,

              obscureText: !formcontroller.isPasswordVisible.value,

              suffixIcon: IconButton(
                onPressed: formcontroller.togglePasswordVisibility,

                icon: Icon(
                  formcontroller.isPasswordVisible.value
                      ? Icons.visibility
                      : Icons.visibility_off,
                ),
              ),

              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter password';
                }

                if (value.length < 6) {
                  return 'Password must be at least 6 characters';
                }

                return null;
              },
            ),
          ),

          SizedBox(height: 15.h),

          // Confirm Password
          Obx(
            () => CustomTextFormField(
              controller: formcontroller.confirmPasswordController,

              hintText: 'Confirm your password',
              prefixIcon: Icons.lock_outline,

              obscureText: !formcontroller.isConfirmPasswordVisible.value,

              suffixIcon: IconButton(
                onPressed: formcontroller.toggleConfirmPasswordVisibility,

                icon: Icon(
                  formcontroller.isConfirmPasswordVisible.value
                      ? Icons.visibility
                      : Icons.visibility_off,
                ),
              ),

              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please confirm password';
                }

                if (value != formcontroller.passwordController.text) {
                  return 'Password does not match';
                }

                return null;
              },
            ),
          ),

          SizedBox(height: 25.h),

          GestureDetector(onTap: formcontroller.signUp

            ,
            child: CustomButtonContainer(title: 'Sign Up',),
          ),

        ],
      ),
    );
  }
}


