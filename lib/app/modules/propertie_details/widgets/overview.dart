import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:growup_agro/app/theme/text_theme.dart';

Widget overview(){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      text_18_700('Overview', color: Colors.purple),
      Gap(16),
      text_12_400("""Premium Lake-Adjacent Co-Ownership Development In Dhanmondi. Each Of The 8 Equal Shares Corresponds To One Finished 3-Bed Apartment, Funded Transparently Via Escrow. Emphasis On Cross-Ventilated Layouts, South-East Orientation, Family-First Planning And Code-Compliant Safety.
      
Shares Are Allotted Via A Publicly Held Lottery In The Presence Of An Independent Auditor After "Ready-To-Live" Status. Handover Is Followed By Deed/Registration In The Winner's Name Per Agreement. Members Get Construction Updates, Financials, And QA Reports In The Client Portal""", color: Colors.grey),
    ],
  );
}