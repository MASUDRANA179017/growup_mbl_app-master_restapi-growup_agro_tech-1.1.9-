import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:growup_agro/app/theme/colors.dart';
import 'package:growup_agro/app/theme/text_theme.dart';

AppBar mainAppBar({
  String? title,
  Function()? onBack,
  Color backgroundColor = deepGreenColor,
  Color textColor = Colors.white,
  Color iconColor = Colors.white,
  bool? centerTitle = true
}) {
  return AppBar(
    backgroundColor: backgroundColor,
    title: text_20_600(title ?? '', color: textColor),
    centerTitle: centerTitle,
    leading: IconButton(
      onPressed:
          onBack ??
          () {
            Get.back();
          },
      icon: Icon(Icons.arrow_back_outlined, color: iconColor),
    ),
  );
}
