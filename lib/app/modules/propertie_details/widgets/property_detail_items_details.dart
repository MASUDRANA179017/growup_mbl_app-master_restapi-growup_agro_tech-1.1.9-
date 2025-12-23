import 'package:flutter/material.dart';
import 'package:growup_agro/app/modules/propertie_details/controllers/propertie_details_controller.dart';
import 'package:growup_agro/app/modules/propertie_details/widgets/overview.dart';
import 'package:growup_agro/app/modules/propertie_details/widgets/payment_term.dart';
import 'package:growup_agro/app/modules/propertie_details/widgets/specification.dart';

Widget propertyDetailItemDetails(PropertiesDetailsController controller){
  if(controller.selectedIndex.value == 0){
    return overview();
  }
  if(controller.selectedIndex.value == 1){
    return specification();
  }
  if(controller.selectedIndex.value == 2){
    return paymentTerm();
  }
  if(controller.selectedIndex.value == 3){
    return SizedBox.shrink();
  }

  return SizedBox.shrink();
}

