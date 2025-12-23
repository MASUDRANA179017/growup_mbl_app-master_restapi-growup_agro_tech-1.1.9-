import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

/// Network Image Slider with Shimmer Loader & Error Handling
Widget networkImageSlider({required RxInt currentIndex, required List<String> imageList, required CarouselSliderController controller}) {
  return CarouselSlider.builder(
    carouselController: controller,
    itemCount: imageList.length,
    itemBuilder: (context, index, i) {

      final item = imageList[index];
      return ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: CachedNetworkImage(
          imageUrl: item,
          fit: BoxFit.fill,
          placeholder: (context, url) => Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Container(
              color: Colors.grey,
            ),
          ),
          errorWidget: (context, url, error) => Container(
            color: Colors.grey.shade200,
            child: const Icon(
              Icons.broken_image,
              color: Colors.grey,
              size: 50,
            ),
          ),
        ),
      );
    },
    options: CarouselOptions(
      height: 120, // adjust slider height
      viewportFraction: 0.5,
      enlargeCenterPage: true,
      autoPlay: true,
      autoPlayInterval: const Duration(seconds: 3),
      autoPlayAnimationDuration: const Duration(milliseconds: 800),
      onPageChanged: (index, reason){
        currentIndex.value = index;
      }
    ),
  );
}
