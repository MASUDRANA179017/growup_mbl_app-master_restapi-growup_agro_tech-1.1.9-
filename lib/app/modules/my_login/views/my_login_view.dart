import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:growup_agro/app/routes/app_pages.dart';
import '../controllers/my_login_controller.dart';

class MyLoginView extends GetView<MyLoginController> {
  const MyLoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/GrowUPlogin.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              children: [
                SizedBox(height: height * 0.03),
                FadeTransition(
                  opacity: controller.logoOpacity,
                  child: SlideTransition(
                    position: controller.logoSlide,
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/GrowupLogo.png',
                          color: Colors.white,
                          height: height * 0.33,
                          width: width * 0.6,
                          fit: BoxFit.contain,
                        ),
                        const Text(
                          'Sign In',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          'Welcome Back!',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                FadeTransition(
                  opacity: controller.formOpacity,
                  child: SlideTransition(
                    position: controller.formSlide,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.08),
                      child: _buildLoginForm(controller, width),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoginForm(MyLoginController controller, double width) {
    return Column(
      children: [
        _buildTextField(
          controller: controller.usernameController,
          hintText: "Enter your email or phone no",
          icon: Icons.email_outlined,
          // keyboardType: TextInputType.emailAddress
        ),
        const SizedBox(height: 10),
        Obx(() => _buildTextField(
          controller: controller.passwordController,
          hintText: "Enter your password",
          icon: Icons.key,
          keyboardType: TextInputType.visiblePassword,
          obscureText: controller.hidePassword.value,
          suffixIcon: IconButton(
            onPressed: () => controller.hidePassword.value = !controller.hidePassword.value,
            icon: Icon(
              controller.hidePassword.value ? Icons.visibility_off : Icons.visibility,
              size: 18,
              color: Colors.green,
            ),
          ),
        )),
        Obx(() => Row(
          children: [
            Checkbox(
              value: controller.rememberMe.value,
              onChanged: (value) {
                if (value != null) controller.updateRememberMe(value);
              },
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
              side: const BorderSide(color: Colors.white),
              fillColor: MaterialStateProperty.resolveWith<Color>(
                      (states) => states.contains(MaterialState.selected) ? Colors.white : Colors.transparent),
              checkColor: Colors.black,
            ),
            const Text('Remember me', style: TextStyle(color: Colors.white, fontSize: 15)),
          ],
        )),
        const SizedBox(height: 8),
        Obx(() => ElevatedButton(
          onPressed: controller.isLoading.value ? null : controller.login,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            minimumSize: const Size(double.infinity, 50),
          ),
          child: controller.isLoading.value
              ? const SizedBox(
            height: 20,
            width: 20,
            child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
          )
              : const Text('Login', style: TextStyle(color: Colors.white, fontSize: 18)),
        )),
        const SizedBox(height: 12),
        Obx(() => TextButton(
          onPressed: controller.isForgotLoading.value ? null : controller.handleForgotPassword,
          child: controller.isForgotLoading.value
              ? const SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(color: Colors.green, strokeWidth: 2),
          )
              : Column(
            children: const [
              Text('Forgot Password?', style: TextStyle(color: Colors.green, fontSize: 15)),
              SizedBox(height: 2),
              SizedBox(width: 130, child: Divider(color: Colors.white24, thickness: 1.2)),
            ],
          ),
        )),
        const SizedBox(height: 20),
        Obx(() => Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Don't Have an Account?", style: TextStyle(color: Colors.white, fontSize: 15)),
            TextButton(
              onPressed: controller.isSignUpLoading.value
                  ? null
                  : () async {
                controller.isSignUpLoading.value = true;
                await Future.delayed(const Duration(milliseconds: 300));
                controller.isSignUpLoading.value = false;
                Get.offAllNamed(Routes.MY_REGISTER);
              },
              child: controller.isSignUpLoading.value
                  ? const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(color: Colors.green, strokeWidth: 2),
              )
                  : const Text('Sign Up', style: TextStyle(color: Colors.green, fontSize: 15)),
            ),
          ],
        )),
      ],
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
    bool obscureText = false,
    TextInputType? keyboardType,
    Widget? suffixIcon,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey.shade100,
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 8.0),
          child: Icon(icon, color: Colors.green, size: 18),
        ),
        suffixIcon: suffixIcon,
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide.none),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(28)),
        contentPadding: const EdgeInsets.symmetric(vertical: 10),
      ),
    );
  }
}
