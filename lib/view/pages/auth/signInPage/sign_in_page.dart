import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:noteapp/controller/appData/appData.dart';
import 'package:noteapp/view/pages/auth/widgets/customButton.dart';

import '../../../../controller/auth_controller/formController.dart';
import '../../../widgets/customText.dart';
import '../widgets/customTextFormField.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});
  final FormController formcontroller = Get.put(FormController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      height: 500.h,
      width: 400.w,
      decoration: BoxDecoration(
        color:
            //Colors.red
            whiteColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Form(
        key: formcontroller.formKey,
        child: Column(
          children: [
            SizedBox(height: 20.h),
            Align(
              alignment: Alignment.topLeft,

              child: CustomTextWidget(
                title: 'Phone Number',
                fontS: 18,
                textColor: blackColor,
              ),
            ),

            // Phone Number
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

            SizedBox(height: 20.h),
            Align(
              alignment: Alignment.topLeft,

              child: CustomTextWidget(
                title: 'Password',
                fontS: 18,
                textColor: blackColor,
              ),
            ),
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

                  return null;
                },
              ),
            ),

            SizedBox(height: 25.h),

            GestureDetector(
              onTap: formcontroller.signIn,
              child: CustomButtonContainer(title: "Sign In"),
            ),
          ],
        ),
      ),
    );
  }
}
