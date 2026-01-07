import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Widget buildShimmerGrid(int crossAxisCount) {
  return GridView.builder(
    padding: const EdgeInsets.all(12),
    itemCount: 8,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: crossAxisCount,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      childAspectRatio: 1.3,
    ),
    itemBuilder: (_, __) {
      return Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Card(
          elevation: 2,
          clipBehavior: Clip.antiAlias, // 🔥 MOST IMPORTANT
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🔹 Image Placeholder (Rounded Top handled by clipBehavior)
              Expanded(
                child: Container(
                  width: double.infinity,
                  color: Colors.white,
                ),
              ),

              // 🔹 Text placeholders
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 14,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Container(
                      height: 12,
                      width: 80,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
