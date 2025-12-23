import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:growup_agro/app/modules/propertie_details/controllers/propertie_details_controller.dart';
import 'package:growup_agro/app/theme/colors.dart';
import 'package:growup_agro/widgets/custom_button.dart';

Widget PropertyDetailsItems(PropertiesDetailsController controller) {
  return SizedBox(
    height: 30,
    child: ListView.builder(
      padding: EdgeInsets.zero,
      scrollDirection: Axis.horizontal,
      itemCount: controller.propertyDetailItems.length,
      itemBuilder: (context, index) {
        return Obx(() {
          final isSelected = controller.selectedIndex.value == index;

          return CustomButton(
            text: controller.propertyDetailItems[index].name,
            onPressed: () => controller.selectProperty(index),
            backgroundColor:
            isSelected ? Colors.green.shade500 : Colors.white,
            textColor:
            isSelected ? Colors.white : deepGreenColor,
            fontSize: 15,
            borderRadius: 8,
          );
        });
      },
    ),
  );
}
