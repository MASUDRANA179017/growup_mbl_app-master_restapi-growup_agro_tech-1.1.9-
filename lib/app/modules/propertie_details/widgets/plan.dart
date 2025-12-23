import 'package:flutter/material.dart';

Widget paymentPlans(){
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    child: Column(
      children: [
        row(
          left: "Plan",
          middle: "Structure",
          right: "Remarks",
          isHeader: true,
        ),
        const SizedBox(height: 16),

        row(
          left: "Milestone",
          middle:
          "Booking 10% → Land/Permit 20% → Piling 15% → Superstructure 25% → Brick/Plaster 15% → Finishes 10% → Handover 5%",
          right: "Escrow Disbursal",
        ),
        const SizedBox(height: 14),

        row(
          left: "Bank-\nAssisted",
          middle: "Equity 20% + Bank Finance Up To 70%",
          right: "Doc Support",
        ),
        const SizedBox(height: 14),

        row(
          left: "Fast-Track",
          middle: "60% Within 6 Months; Rest Milestones",
          right: "Priority Allotment\nWindow",
        ),
      ],
    ),
  );}

  Widget row({
    required String left,
    required String middle,
    required String right,
    bool isHeader = false,
  }) {
    final Color textColor =
    isHeader ? Colors.grey.shade500 : Colors.grey.shade600;

    final FontWeight weight =
    isHeader ? FontWeight.w500 : FontWeight.w400;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 90,
          child: Text(
            left,
            style: TextStyle(
              fontSize: 13,
              fontWeight: weight,
              color: textColor,
              height: 1.4,
            ),
          ),
        ),
        Expanded(
          child: Text(
            middle,
            style: TextStyle(
              fontSize: 13,
              fontWeight: weight,
              color: textColor,
              height: 1.4,
            ),
          ),
        ),
        SizedBox(
          width: 120,
          child: Text(
            right,
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 13,
              fontWeight: weight,
              color: textColor,
              height: 1.4,
            ),
          ),
        ),
      ],
    );
  }

