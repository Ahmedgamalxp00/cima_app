import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Shimmer shimmerItem(
    {required double height, double width = 0, double radius = 8.0}) {
  return Shimmer.fromColors(
    baseColor: Colors.grey[850]!,
    highlightColor: Colors.grey[800]!,
    child: SizedBox(
      width: width,
      height: height,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
    ),
  );
}

Widget listViewShimmer() {
  return Row(
    children: [
      const SizedBox(width: 10),
      shimmerItem(height: 120, width: 0.7 * 120),
      const SizedBox(width: 10),
      shimmerItem(height: 120, width: 0.7 * 120),
      const SizedBox(width: 10),
      shimmerItem(height: 120, width: 0.7 * 120),
      const SizedBox(width: 10),
      shimmerItem(height: 120, width: 0.7 * 120),
    ],
  );
}

Widget sliderShemmer() {
  return shimmerItem(height: 380, width: double.infinity, radius: 0);
}

Widget movieDetailsShemmer() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      shimmerItem(height: 250, width: double.infinity, radius: 0),
      Padding(
        padding: const EdgeInsets.all(16),
        child: shimmerItem(
          height: 35,
          width: double.infinity,
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            shimmerItem(height: 30, width: 70),
            const SizedBox(width: 16),
            shimmerItem(height: 30, width: 70),
            const SizedBox(width: 16),
            shimmerItem(height: 30, width: 70),
          ],
        ),
      ),
      Padding(
          padding: const EdgeInsets.all(16),
          child: shimmerItem(
            height: 120,
            width: double.infinity,
          )),
      const SizedBox(height: 14),
      Padding(
        padding: const EdgeInsets.all(16),
        child: shimmerItem(
          height: 35,
          width: 180,
        ),
      ),
      const SizedBox(height: 14),
      Row(
        children: [
          const SizedBox(width: 16),
          Expanded(child: shimmerItem(height: 150, width: 100)),
          const SizedBox(width: 10),
          Expanded(child: shimmerItem(height: 150, width: 100)),
          const SizedBox(width: 10),
          Expanded(child: shimmerItem(height: 150, width: 100)),
          const SizedBox(width: 16),
        ],
      )
    ],
  );
}
