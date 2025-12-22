import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:growup_agro/app/routes/app_pages.dart';

import '../controllers/my_register_controller.dart';

class MyRegisterView extends GetView<MyRegisterController> {
  const MyRegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    final height = mediaQuery.height;
    final width = mediaQuery.width;

    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(onPressed: (){
          Get.offAllNamed(Routes.MY_LOGIN);
        }, icon: Icon(Icons.arrow_back, color: Colors.white,)),
      ),
      body: Stack(
        children: [
          // Background
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/register.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // BackdropFilter(
          //   filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
          //   child: Container(
          //     color: Colors.black.withValues(alpha:  0.2),
          //   ),
          // ),
          SafeArea(
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: height),
                child: IntrinsicHeight(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.08),
                    child: SlideTransition(
                      position: controller.slideAnimation,
                      child: FadeTransition(
                        opacity: controller.fadeAnimation,
                        child: Column(
                          children: [
                            SizedBox(height: height * 0.04),
                            // Title
                            Center(
                              child: Text(
                                'Register Your Account',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: width * 0.07,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(height: height * 0.03),
                            // Form fields
                            buildInputField("Full Name", Icons.verified_user, controller.nameController),
                            buildInputField("Email Address", Icons.email_outlined, controller.emailController),
                            buildInputField("Phone", Icons.phone, controller.phoneController),
                            Obx(() => buildInputField(
                              "Password",
                              Icons.key,
                              controller.passwordController,
                              isPassword: true,
                              obscureText: controller.obscurePassword.value,
                              toggleVisibility: controller.togglePassword,
                            )),
                            Obx(() => buildInputField(
                              "Confirm Password",
                              Icons.key,
                              controller.confirmPasswordController,
                              isPassword: true,
                              obscureText: controller.obscureConfirmPassword.value,
                              toggleVisibility: controller.toggleConfirmPassword,
                            )),
                            SizedBox(height: height * 0.04),
                            // Register button
                            Obx(() => SizedBox(
                              width: double.infinity,
                              height: 50,
                              child: ElevatedButton(
                                onPressed: controller.isLoadingRegister.value
                                    ? null
                                    : controller.registerUser,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25)),
                                  elevation: 0,
                                ),
                                child: controller.isLoadingRegister.value
                                    ? const SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator(
                                      color: Colors.white, strokeWidth: 2),
                                )
                                    : const Text('Sign Up',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18)),
                              ),
                            )),
                            SizedBox(height: height * 0.03),
                            // Sign In link
                            Obx(() => Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("Already Have an Account? ",
                                    style: TextStyle(color: Colors.white)),
                                TextButton(
                                  onPressed: controller.isLoadingSignIn.value
                                      ? null
                                      : () {

                                    controller.isLoadingSignIn.value = true;
                                    Future.delayed(
                                        const Duration(milliseconds: 300), () {
                                      controller.isLoadingSignIn.value = false;
                                      // Get.back();
                                      Get.offAllNamed(Routes.MY_LOGIN);
                                    });
                                  },
                                  child: controller.isLoadingSignIn.value
                                      ? const SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: CircularProgressIndicator(
                                        color: Colors.green, strokeWidth: 2),
                                  )
                                      : const Text('Sign In',
                                      style: TextStyle(
                                          color: Colors.green,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ],
                            )),
                            SizedBox(height: height * 0.02),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildInputField(String hint, IconData icon, TextEditingController controller,
      {bool isPassword = false, bool obscureText = false, VoidCallback? toggleVisibility}) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: TextField(
        controller: controller,
        obscureText: isPassword ? obscureText : false,
        style: const TextStyle(color: Colors.black),
        decoration: InputDecoration(
          fillColor: Colors.grey.shade100,
          filled: true,
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.grey),
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Icon(icon, color: Colors.green, size: 20),
          ),
          suffixIcon: isPassword
              ? IconButton(
            icon: Icon(obscureText ? Icons.visibility_off : Icons.visibility, color: Colors.green),
            onPressed: toggleVisibility,
          )
              : null,
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: const BorderSide(color: Colors.transparent)),
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: const BorderSide(color: Colors.transparent, width: 2)),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(28)),
          contentPadding: const EdgeInsets.symmetric(vertical: 14),
        ),
      ),
    );
  }
}
