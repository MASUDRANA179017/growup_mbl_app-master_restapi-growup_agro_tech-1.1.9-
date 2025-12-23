import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:growup_agro/app/modules/propertie_details/controllers/propertie_details_controller.dart';
import 'package:growup_agro/app/theme/text_theme.dart';

Widget questionsSection(PropertiesDetailsController controller) {
  return Container(
    margin: const EdgeInsets.all(16).copyWith(top: 4),
    padding: EdgeInsets.all(4),
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Center(
          child: text_16_600('Questions', color: Colors.green),
        ),
        const Gap(12),

        Obx(() => Column(
          children: List.generate(
            controller.questions.length,
                (index) {
              final item = controller.questions[index];
              final isExpanded =
                  controller.expandedIndex.value == index;

              return Container(
                margin: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.04),
                      blurRadius: 6,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: () => controller.toggle(index),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 14),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                '${index + 1}. ${item.question}',
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            CircleAvatar(
                              radius: 14,
                              backgroundColor: isExpanded
                                  ? Colors.red
                                  : Colors.grey.shade300,
                              child: Icon(
                                isExpanded ? Icons.remove : Icons.add,
                                size: 16,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),

                    AnimatedCrossFade(
                      firstChild: const SizedBox.shrink(),
                      secondChild: Padding(
                        padding: const EdgeInsets.fromLTRB(
                            14, 0, 14, 14),
                        child: Text(
                          item.answer,
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ),
                      crossFadeState: isExpanded
                          ? CrossFadeState.showSecond
                          : CrossFadeState.showFirst,
                      duration:
                      const Duration(milliseconds: 200),
                    ),
                  ],
                ),
              );
            },
          ),
        )),
      ],
    ),
  );
}
