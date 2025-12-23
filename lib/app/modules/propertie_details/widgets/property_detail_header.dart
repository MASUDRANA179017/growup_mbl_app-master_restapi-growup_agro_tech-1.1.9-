import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../theme/text_theme.dart';

Widget propertyDetailHeader(){
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0).copyWith(top: 16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        text_12_400('Building Limitless Tomorrow With ROSA', color: Colors.lightGreen),
        Gap(8),
        text_16_500('Deluxe Suite (Beachfront)')
      ],
    ),
  );
}