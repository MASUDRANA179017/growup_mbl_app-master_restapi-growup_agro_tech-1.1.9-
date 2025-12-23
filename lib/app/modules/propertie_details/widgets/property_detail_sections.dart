import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:growup_agro/app/modules/propertie_details/controllers/propertie_details_controller.dart';
import 'package:growup_agro/app/modules/propertie_details/widgets/property_detail_items.dart';
import 'package:growup_agro/app/modules/propertie_details/widgets/property_detail_items_details.dart';

Widget propertyDetailsSection(PropertiesDetailsController controller){
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    padding: EdgeInsets.all(2),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.05),
          blurRadius: 10,
          offset: const Offset(0, 4),
        ),
      ],
    ),
    child: Column(
      children: [
        Gap(16),
        PropertyDetailsItems(controller),
        Gap(16),
        Obx(()=> propertyDetailItemDetails(controller)),
        Gap(16),
      ],
    ),
  );
}