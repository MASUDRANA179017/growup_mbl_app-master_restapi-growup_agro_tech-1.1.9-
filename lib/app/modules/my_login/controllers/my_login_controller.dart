import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:growup_agro/app/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:growup_agro/utils/api_constants.dart';

import '../../../utils/statusbar_helper.dart';

class MyLoginController extends GetxController with GetTickerProviderStateMixin {
  // Secure storage
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();

  // Animation controllers
  late AnimationController logoController;
  late Animation<double> logoOpacity;
  late Animation<Offset> logoSlide;

  late AnimationController formController;
  late Animation<double> formOpacity;
  late Animation<Offset> formSlide;

  // Fields
  var hidePassword = true.obs;
  var rememberMe = false.obs;
  var isLoading = false.obs;
  var isForgotLoading = false.obs;
  var isSignUpLoading = false.obs;

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    StatusBarHelper.setStatusBarTextColor(isDarkText: true);
    _setupAnimations();
    _loadRememberMeValue();
  }

  void _setupAnimations() {
    logoController = AnimationController(vsync: this, duration: const Duration(milliseconds: 1200));
    logoOpacity = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(parent: logoController, curve: Curves.easeIn));
    logoSlide = Tween<Offset>(begin: const Offset(0, -0.5), end: Offset.zero)
        .animate(CurvedAnimation(parent: logoController, curve: Curves.easeOutBack));

    formController = AnimationController(vsync: this, duration: const Duration(milliseconds: 1000));
    formOpacity = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(parent: formController, curve: Curves.easeIn));
    formSlide = Tween<Offset>(begin: const Offset(0, 0.2), end: Offset.zero)
        .animate(CurvedAnimation(parent: formController, curve: Curves.easeOut));

    Timer(const Duration(milliseconds: 200), () => logoController.forward());
    Timer(const Duration(milliseconds: 800), () => formController.forward());
  }

  Future<void> _loadRememberMeValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool val = prefs.getBool('remember_me') ?? false;

    if (val) {
      String? storedUsername = await secureStorage.read(key: 'username');
      String? storedPassword = await secureStorage.read(key: 'password');
      if (storedUsername != null) usernameController.text = storedUsername;
      if (storedPassword != null) passwordController.text = storedPassword;
    }

    rememberMe.value = val;
  }

  Future<void> updateRememberMe(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('remember_me', value);
    rememberMe.value = value;

    if (value) {
      await secureStorage.write(key: 'username', value: usernameController.text);
      await secureStorage.write(key: 'password', value: passwordController.text);
    } else {
      await secureStorage.delete(key: 'username');
      await secureStorage.delete(key: 'password');
    }
  }

  Future<void> handleForgotPassword() async {
    isForgotLoading.value = true;
    final uri = Uri.parse(ApiConstants.forgotPassword);
    try {
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final redirectUrl = data['redirect_url'];
        if (redirectUrl != null) {
          await launchUrlString(redirectUrl, mode: LaunchMode.externalApplication);
        }
      }
    } catch (e) {
      debugPrint("Forgot Password Error: $e");
    } finally {
      isForgotLoading.value = false;
    }
  }

  Future<void> login() async {
    final username = usernameController.text.trim();
    final password = passwordController.text.trim();

    if (username.isEmpty || password.isEmpty) {
      Get.snackbar('Error', 'Please enter both username and password');
      return;
    }

    isLoading.value = true;

    try {
      final token = await _loginRequest(username, password);
      debugPrint('Token: $token');
      Get.snackbar('Success', 'Login successful', backgroundColor: Colors.green, colorText: Colors.white);
      Get.offAllNamed(Routes.MAIN_SCREEN); // named route
    } catch (e) {
      Get.snackbar('Error', e.toString(), backgroundColor: Colors.red, colorText: Colors.white);
    } finally {
      isLoading.value = false;
    }
  }

  Future<String> _loginRequest(String email, String password) async {
    try {
      final url = ApiConstants.login;
      log(url);
      log({'phone_email': email, 'password': password}.toString());
      final response = await http
          .post(
        Uri.parse(ApiConstants.login),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode({'phone_email': email, 'password': password}),
      )
          .timeout(const Duration(seconds: 15));

      log(response.body);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final token = data['token'];
        final investor = data['user'];
        final prefs = await SharedPreferences.getInstance();

        await prefs.setString('auth_token', token);
        await prefs.setString('investor_name', investor['name'] ?? '');
        await prefs.setString('investor_email', investor['email'] ?? '');
        await prefs.setString('investor_phone', investor['phone'] ?? '');
        await prefs.setString('investor_code', investor['investor_code'] ?? '');
        await prefs.setString('investor_id', investor['id'].toString());
        await prefs.setString('investor_image', investor['image'] ?? '');
        await prefs.setString('investor_address', investor['address'] ?? 'Dhaka');
        await prefs.setString('wallet_balance', data['wallet_balance']?.toString() ?? '0');
        await prefs.setString('total_transation', data['total_transation']?.toString() ?? '0');
        await prefs.setString('total_investment', data['total_investment']?.toString() ?? '0');
        await prefs.setString('total_income', data['total_income']?.toString() ?? '0');
        await prefs.setString('todays_income', data['todays_income']?.toString() ?? '0');
        await prefs.setString('total_projects', data['total_projects']?.toString() ?? '0');

        return token;
      } else {
        final json = jsonDecode(response.body);
        final message = json['message'] ?? 'Invalid credentials';
        throw Exception(message);
      }
    } on SocketException {
      throw Exception('No internet connection');
    } on TimeoutException {
      throw Exception('Connection timed out');
    } on HttpException {
      throw Exception('Server error');
    } catch (e) {
      throw Exception('Unexpected login error');
    }
  }

  @override
  void onClose() {
    logoController.dispose();
    formController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
