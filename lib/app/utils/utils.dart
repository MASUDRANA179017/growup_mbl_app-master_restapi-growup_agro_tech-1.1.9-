import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:get/get.dart';
import 'package:growup_agro/app/utils/snackbar.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/colors.dart';

class Utils {
  static void configLoading() {
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 2000)
      ..loadingStyle = EasyLoadingStyle.dark
      ..indicatorSize = 45.0
      ..radius = 10.0
      ..progressColor = primaryColor
      ..backgroundColor = Colors.grey
      ..maskColor = Colors.blue.withValues(alpha: 0.5)
      ..userInteractions = false
      ..dismissOnTap = false
      ..indicatorType = EasyLoadingIndicatorType.circle
      ..maskType = EasyLoadingMaskType.black
      ..loadingStyle = EasyLoadingStyle.light;
  }


  static void showProviderError(int? errorStatus, String? message) async {
    EasyLoading.dismiss();

    if (errorStatus == null) {
      getSnackBar("$message!");
      return;
    }

    switch (errorStatus) {
      case 401:
      /// Unauthorized - Clear user data and token and navigate to login page
      //   UserStorageService.deleteAll();
      //   CheckInDatabase().deleteAll();
        getSnackBar("$message!");
        // Get.offAllNamed(Routes.AUTH);
        break;
      case 404:
        getSnackBar("$message!",color:  red);
        break;
      case 409:
        getSnackBar("$message!",color:  red);
        break;
      case 422:
        getSnackBar("$message!",color:  red);
        break;
      case 500:
        getSnackBar("$message!", color:  red);
        break;
      default:
        getSnackBar("$message!");
        break;
    }
  }

  static Future<void> launchURL(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }

  static bool isValidPhoneNumber(String? s) {
    if (s == null || s.isEmpty) return false;

    final phonePattern = r'^(013|014|015|016|017|018|019)\d{8}$';
    final regExp = RegExp(phonePattern);

    return regExp.hasMatch(s);
  }


  static bool isValidUrl(String input) {
    try {
      final uri = Uri.tryParse(input);
      return uri != null &&
          (uri.isScheme('http') || uri.isScheme('https')) &&
          uri.hasAuthority;
    } catch (e) {
      return false;
    }
  }

  static MultipartFile imageToMultipartFile(String selectedImagePath) {
    String fileName = selectedImagePath.split('/').last;

    return MultipartFile(
      File(selectedImagePath),
      filename: fileName,
      contentType: "multipart/form-data",
    );
  }

}