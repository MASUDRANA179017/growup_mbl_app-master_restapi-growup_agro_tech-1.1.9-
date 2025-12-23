import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

Widget buildDotsIndicator({
  List<String> imageList = const [],
  required int currentIndex,
  required CarouselSliderController controller
}) {
  if (imageList.isEmpty) return const SizedBox();
  return AnimatedSmoothIndicator(
    activeIndex: currentIndex,
    count: imageList.length,
    effect: ExpandingDotsEffect(
      dotHeight: 9,
      dotWidth: 9,
      activeDotColor: Colors.orange,
      dotColor: Colors.orange[100],
      expansionFactor: 3,
      spacing: 4,
    ),
    onDotClicked: (index) {
      controller.animateToPage(index);
    },
  );
}
