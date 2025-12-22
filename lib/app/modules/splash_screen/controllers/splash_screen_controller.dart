import 'package:get/get.dart';
import 'package:growup_agro/app/utils/statusbar_helper.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../routes/app_pages.dart';

import 'package:flutter/material.dart';

class SplashScreenController extends GetxController with GetSingleTickerProviderStateMixin {
  // Animation
  late AnimationController logoController;
  late Animation<double> logoAnimation;

  // Version
  var version = ''.obs;

  // Update check flag
  var checkingUpdate = true.obs;

  bool _updateChecked = false;

  @override
  void onInit() {
    super.onInit();
    // StatusBarHelper.setStatusBarTextColor(isDarkText: true);
    _initAnimation();
    _loadVersion();
    _checkForUpdate();
  }

  void _initAnimation() {
    logoController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );
    logoAnimation = CurvedAnimation(parent: logoController, curve: Curves.easeIn);
    logoController.forward();
  }

  Future<void> _loadVersion() async {
    try {
      final info = await PackageInfo.fromPlatform();
      version.value = 'v${info.version}';
    } catch (_) {
      version.value = 'v1.0.0';
    }
  }

  Future<void> _checkForUpdate() async {
    try {
      final info = await InAppUpdate.checkForUpdate();

      checkingUpdate.value = false;

      if (info.updateAvailability == UpdateAvailability.updateAvailable) {
        await InAppUpdate.performImmediateUpdate();
      } else {
        _continueToNext();
      }
    } catch (e) {
      debugPrint("Update check failed: $e");
      checkingUpdate.value = false;
      _continueToNext();
    }
  }

  Future<void> _continueToNext() async {
    if (_updateChecked) return;
    _updateChecked = true;

    await Future.delayed(const Duration(seconds: 5)); // splash delay

    final prefs = await SharedPreferences.getInstance();
    final seenOnboarding = prefs.getBool('seenOnboarding') ?? false;

    if (seenOnboarding) {
      Get.offAllNamed(Routes.MY_LOGIN);
    } else {
      Get.offAllNamed(Routes.ONBOARDING);
    }
  }

  @override
  void onClose() {
    logoController.dispose();
    super.onClose();
  }
}
