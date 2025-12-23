import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:growup_agro/app/modules/propertie_details/widgets/plan.dart';

import '../../../theme/text_theme.dart';

Widget paymentTerm(){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      text_18_700('Payment Term', color: Colors.purple),
      Gap(16),
      paymentPlans()
    ],
  );
}