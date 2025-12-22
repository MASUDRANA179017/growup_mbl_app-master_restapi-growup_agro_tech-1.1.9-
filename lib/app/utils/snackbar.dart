import 'package:flutter/material.dart';
import 'package:get/get.dart';

void getSnackBar(
  String message, {
  String title = "Error",
  Color color = Colors.red,
  Color textColor = Colors.white,
  IconData? icon = Icons.error,
}) {
  Get.snackbar(
    title,
    message,
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: color,
    colorText: textColor,
    borderRadius: 12,
    margin: const EdgeInsets.all(10),
    icon: icon != null
        ? Icon(
            icon,
            color: textColor,
          )
        : null,
    shouldIconPulse: true,
    barBlur: 20,
    isDismissible: true,
    duration: const Duration(seconds: 3),
  );
}