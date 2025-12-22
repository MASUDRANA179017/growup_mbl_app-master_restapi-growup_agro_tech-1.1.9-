import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:growup_agro/app/routes/app_pages.dart';
import 'package:growup_agro/utils/api_constants.dart';
import 'package:http/http.dart' as http;

class MyRegisterController extends GetxController with GetSingleTickerProviderStateMixin {
  // Text controllers
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // Loading states
  final isLoadingRegister = false.obs;
  final isLoadingSignIn = false.obs;

  // Password visibility
  final obscurePassword = true.obs;
  final obscureConfirmPassword = true.obs;

  // Animation controllers
  late AnimationController fadeController;
  late Animation<double> fadeAnimation;
  late Animation<Offset> slideAnimation;

  @override
  void onInit() {
    super.onInit();
    // Initialize animations properly
    fadeController = AnimationController(vsync: this, duration: const Duration(milliseconds: 800));
    fadeAnimation = CurvedAnimation(parent: fadeController, curve: Curves.easeIn);
    slideAnimation = Tween<Offset>(begin: const Offset(0, 0.15), end: Offset.zero)
        .animate(CurvedAnimation(parent: fadeController, curve: Curves.easeInOut));
    fadeController.forward();
  }

  @override
  void onClose() {
    fadeController.dispose();
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }

  void togglePassword() => obscurePassword.value = !obscurePassword.value;
  void toggleConfirmPassword() => obscureConfirmPassword.value = !obscureConfirmPassword.value;

  Future<void> registerUser() async {
    isLoadingRegister.value = true;

    final name = nameController.text.trim();
    final email = emailController.text.trim();
    final phone = phoneController.text.trim();
    final password = passwordController.text.trim();
    final confirmPassword = confirmPasswordController.text.trim();

    // Validations
    if (name.isEmpty || email.isEmpty || phone.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      Get.snackbar("Error", "All fields are required", backgroundColor: Colors.red, colorText: Colors.white);
      isLoadingRegister.value = false;
      return;
    }

    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(email)) {
      Get.snackbar("Error", "Enter a valid email address", backgroundColor: Colors.red, colorText: Colors.white);
      isLoadingRegister.value = false;
      return;
    }

    final phoneRegex = RegExp(r'^(?:\+?88)?01[3-9]\d{8}$');
    if (!phoneRegex.hasMatch(phone)) {
      Get.snackbar("Error", "Enter a valid phone number (min 11 digits)", backgroundColor: Colors.red, colorText: Colors.white);
      isLoadingRegister.value = false;
      return;
    }

    if (password.length < 6) {
      Get.snackbar("Error", "Password must be at least 6 characters", backgroundColor: Colors.red, colorText: Colors.white);
      isLoadingRegister.value = false;
      return;
    }

    if (password != confirmPassword) {
      Get.snackbar("Error", "Passwords do not match", backgroundColor: Colors.red, colorText: Colors.white);
      isLoadingRegister.value = false;
      return;
    }

    try {
      final response = await http.post(
        Uri.parse(ApiConstants.userRegistration),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'name': name,
          'email': email,
          'phone': phone,
          'password': password,
          'password_confirmation': confirmPassword,
        }),
      );

      final data = jsonDecode(response.body);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        Get.snackbar("Success", "Registration successful", backgroundColor: Colors.green, colorText: Colors.white);
        Future.delayed(const Duration(seconds: 1), () {
          Get.offAllNamed(Routes.MY_LOGIN);
        });
      } else if (data['errors'] != null) {
        final firstError = (data['errors'] as Map).values.first[0];
        Get.snackbar("Error", firstError.toString(), backgroundColor: Colors.red, colorText: Colors.white);
      } else {
        Get.snackbar("Error", "Registration failed. Please try again", backgroundColor: Colors.red, colorText: Colors.white);
      }
    } catch (e) {
      Get.snackbar("Error", e.toString(), backgroundColor: Colors.red, colorText: Colors.white);
    } finally {
      isLoadingRegister.value = false;
    }
  }
}
