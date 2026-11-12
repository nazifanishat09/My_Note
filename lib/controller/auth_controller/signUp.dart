
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noteapp/controller/appData/appData.dart';

class FormController extends GetxController {

  // Text Editing Controllers
  final numberController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // Form Key
  final formKey = GlobalKey<FormState>();

  // Password Visibility
  final isPasswordVisible = false.obs;
  final isConfirmPasswordVisible = false.obs;

  // Toggle Password Visibility
  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  // Toggle Confirm Password Visibility
  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible.value =
    !isConfirmPasswordVisible.value;
  }

  // Sign Up Function
  void signUp() {
    if (formKey.currentState!.validate()) {

      String number = numberController.text.trim();
      String email = emailController.text.trim();
      String password = passwordController.text;

      Get.snackbar(
        'Success',
        'Phone: $number\nEmail: $email',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  // Sign In Function
  void signIn() {
    if (formKey.currentState!.validate()) {

      String number = numberController.text.trim();
      String password = passwordController.text;

      Get.snackbar(backgroundColor: greenColor,
        'Success',
        'Phone: $number\nLogin validation successful!',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  // Clear All Fields
  void clearFields() {
    numberController.clear();
    emailController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
  }

  // Dispose Controllers
  @override
  void onClose() {
    numberController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();

    super.onClose();
  }
}
