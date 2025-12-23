import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:growup_agro/app/component/app_bar.dart';
import 'package:growup_agro/app/modules/propertie_details/widgets/image_slider_with_dots.dart';
import 'package:growup_agro/app/modules/propertie_details/widgets/network_image_slider.dart';
import 'package:growup_agro/app/modules/propertie_details/widgets/property_detail_header.dart';
import 'package:growup_agro/app/modules/propertie_details/widgets/property_detail_items.dart';
import 'package:growup_agro/app/modules/propertie_details/widgets/property_detail_items_details.dart';
import 'package:growup_agro/app/modules/propertie_details/widgets/property_detail_sections.dart';
import 'package:growup_agro/app/modules/propertie_details/widgets/question_answer.dart';
import 'package:growup_agro/app/theme/text_theme.dart';

import '../controllers/propertie_details_controller.dart';

class PropertiesDetailsView extends GetView<PropertiesDetailsController> {
  const PropertiesDetailsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainAppBar(title: 'Property Details'),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              propertyDetailHeader(),
              Gap(16),
              imageSliderWithDots(controller),
              propertyDetailsSection(controller),
              questionsSection(controller),
              Gap(16),

              
            ],
          ),
        ),
      )
    );
  }
}
