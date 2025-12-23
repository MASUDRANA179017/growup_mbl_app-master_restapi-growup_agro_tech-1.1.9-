import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:growup_agro/app/modules/propertie_details/widgets/dash_border.dart';

import '../../../theme/text_theme.dart';

Widget specification(){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      text_18_700('Specification', color: Colors.purple),
      Gap(16),
      Row(children: [
        dashBorder(icon: FontAwesomeIcons.hatCowboy, title: 'Apartments & Flats', value: 'Ready & Under-Construction'),
        Gap(8),
        dashBorder(icon: FontAwesomeIcons.hatCowboy, title: 'Land/Plot', value: 'Development & Joint Ventures'),
      ],),
      Gap(8),
      Row(children: [
        dashBorder(icon: FontAwesomeIcons.building, title: 'Co-Ownership Housing', value: 'Building Share & Allocation'),
        Gap(8),
        dashBorder(icon: FontAwesomeIcons.building, title: 'Hotel Share', value: 'Lifetime Holding With Stay Privileges'),
      ],),
      Gap(8),
      Row(children: [
        dashBorder(icon: FontAwesomeIcons.building, title: 'Co-Ownership Housing', value: 'Building Share & Allocation'),
        Gap(8),
        dashBorder(icon: FontAwesomeIcons.building, title: 'Hotel Share', value: 'Lifetime Holding With Stay Privileges'),
      ],),
    ],
  );
}