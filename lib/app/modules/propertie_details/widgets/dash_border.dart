import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:gap/gap.dart';
import 'package:growup_agro/app/theme/text_theme.dart';

Widget dashBorder({IconData? icon, String? title, String? value, Function()? onTap}) {
  return Expanded(
    child: DottedBorder(
      options: RectDottedBorderOptions(
        dashPattern: [5, 5],
        strokeWidth: 1,
        color: Colors.grey.shade400,
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4)
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.black, size: 15,),
          Gap(8),
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              text_14_500(title, color: Colors.black, maxLine: 1),
              text_10_400(value, color: Colors.grey, maxLine: 1)
            ],
          ))
        ],
      )
      // child: ListTile(
      //   onTap: onTap,
      //   leading: Icon(icon),
      //   title: text_16_500(title, color: Colors.black),
      //   subtitle: text_14_400(value, color: Colors.grey),
      // ),
    ),
  );
}
