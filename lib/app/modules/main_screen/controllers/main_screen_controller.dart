import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:growup_agro/app/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:growup_agro/utils/api_constants.dart';

class MainScreenController extends GetxController {
  var selectedIndex = 0.obs;
  var bottomNavIndex = 0.obs;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  var profile = {}.obs;

  @override
  void onInit() {
    super.onInit();
    _loadProfile();
    _refreshProfile();
  }

  void _loadProfile() async {
    profile.value = await getInvestorProfileFromPrefs();
  }

  void _refreshProfile() async {
    await fetchAndSaveInvestorProfile();
    _loadProfile();
  }

  void onItemTapped(int index) {
    if (index == 4) {
      if (scaffoldKey.currentState?.hasEndDrawer ?? false) {
        scaffoldKey.currentState?.openEndDrawer();
      }
    } else {
      bottomNavIndex.value = index;
      selectedIndex.value = index;
    }
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('auth_token') ?? '';
    final investorCode = prefs.getString('investor_code') ?? '';

    try {
      final url = Uri.parse(ApiConstants.logout);
      final response = await http.post(
        url,
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        },
        body: {'investor_code': investorCode},
      );

      if (response.statusCode == 200) {
        await prefs.clear();
        Get.offAllNamed(Routes.MY_LOGIN);
        Get.snackbar('Success', 'Logout successful',
            backgroundColor: Colors.green, colorText: Colors.white);
      } else {
        Get.snackbar('Error', 'Logout failed', backgroundColor: Colors.red, colorText: Colors.white);
      }
    } catch (e) {
      Get.snackbar('Error', 'Error: $e', backgroundColor: Colors.red, colorText: Colors.white);
    }
  }

  Future<Map<String, dynamic>> getInvestorProfileFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      'name': prefs.getString('investor_name') ?? 'N/A',
      'email': prefs.getString('investor_email') ?? 'N/A',
      'phone': prefs.getString('investor_phone') ?? 'N/A',
      'code': prefs.getString('investor_code') ?? 'N/A',
      'image': prefs.getString('investor_image') ?? '',
    };
  }

  Future<void> fetchAndSaveInvestorProfile() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('auth_token') ?? '';
    final investorCode = prefs.getString('investor_code') ?? '';

    var url = ApiConstants.investorProfile(investorCode);
    final uri = Uri.parse(url);
    final response = await http.get(uri, headers: {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    });

    log(response.body);
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final data = jsonData['data']['investor'];
      await prefs.setString('investor_name', data['name'] ?? '');
      await prefs.setString('investor_email', data['email'] ?? '');
      await prefs.setString('investor_phone', data['phone'] ?? '');
      await prefs.setString('investor_code', data['investor_code'] ?? '');
      await prefs.setString('investor_image', data['image'] ?? '');
    }
  }
}
