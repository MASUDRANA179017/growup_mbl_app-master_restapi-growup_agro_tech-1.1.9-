import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:growup_agro/app/modules/propertie_details/controllers/propertie_details_controller.dart';
import 'package:growup_agro/app/modules/propertie_details/widgets/image_dots.dart';
import 'package:growup_agro/app/modules/propertie_details/widgets/network_image_slider.dart';

Widget imageSliderWithDots(PropertiesDetailsController controller){
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      networkImageSlider(imageList: controller.imageList, controller: controller.controller, currentIndex: controller.currentIndex),
      Gap(8),
      Obx(()=> buildDotsIndicator(imageList: controller.imageList, currentIndex: controller.currentIndex.value, controller: controller.controller))
      ,Gap(8),
    ],
  );
}