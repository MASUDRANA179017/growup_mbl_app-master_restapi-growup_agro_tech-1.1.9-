import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';

Widget networkImage(
    String? url, {
      double? width,
      double? height,
      BoxFit fit = BoxFit.cover,
      double radius = 12,
      bool onlyTopCircular = true,
      Widget? errorWidget,
      Color shimmerBaseColor = const Color(0xFFE0E0E0),
      Color shimmerHighlightColor = const Color(0xFFF5F5F5),
    }) {
  // Null / empty url protection
  if (url == null || url.isEmpty) {
    return _errorContainer(
      width: width,
      height: height,
      borderRadius: _borderRadius(radius, onlyTopCircular: onlyTopCircular),
      child: errorWidget,
    );
  }

  final image = CachedNetworkImage(
    imageUrl: url,
    width: width,
    height: height,
    fit: fit,
    placeholder: (_, __) => _shimmerLoader(
      width: width,
      height: height,
      borderRadius: _borderRadius(radius, onlyTopCircular: onlyTopCircular),
      baseColor: shimmerBaseColor,
      highlightColor: shimmerHighlightColor,
    ),
    errorWidget: (_, __, ___) => _errorContainer(
      width: width,
      height: height,
      borderRadius: _borderRadius(radius, onlyTopCircular: onlyTopCircular),
      child: errorWidget,
    ),
  );

  return radius != 0
      ? ClipRRect(
    borderRadius: _borderRadius(radius, onlyTopCircular: onlyTopCircular),
    child: image,
  )
      : image;
}

BorderRadius _borderRadius(double radius, {bool onlyTopCircular = false}){

  return onlyTopCircular ? BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12)): BorderRadius.circular(radius);
}
Widget _shimmerLoader({
  double? width,
  double? height,
  BorderRadius? borderRadius,
  required Color baseColor,
  required Color highlightColor,
}) {
  final child = Container(
    width: width,
    height: height,
    color: Colors.white,
  );

  return Shimmer.fromColors(
    baseColor: baseColor,
    highlightColor: highlightColor,
    child: borderRadius != null
        ? ClipRRect(borderRadius: borderRadius, child: child)
        : child,
  );
}

Widget _errorContainer({
  double? width,
  double? height,
  BorderRadius? borderRadius,
  Widget? child,
}) {
  final content = Container(
    width: width,
    height: height,
    alignment: Alignment.center,
    color: Colors.grey.shade200,
    child: child ??
        const Icon(
          Icons.broken_image_outlined,
          size: 32,
          color: Colors.grey,
        ),
  );

  return borderRadius != null
      ? ClipRRect(borderRadius: borderRadius, child: content)
      : content;
}
