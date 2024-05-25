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
    ],
  );
}

class GridViewShimmer extends StatelessWidget {
  const GridViewShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 24.0),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return shimmerItem(height: 150);
          },
          childCount: 6,
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
          childAspectRatio: 0.7,
          crossAxisCount: 3,
        ),
      ),
    );
  }
}

Widget seeMoreListViewShimmer() {
  return ListView.separated(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 90, bottom: 10),
      itemBuilder: (context, indext) {
        return shimmerItem(height: 136, width: double.infinity);
      },
      separatorBuilder: (context, indext) {
        return const SizedBox(
          height: 10,
        );
      },
      itemCount: 5);
}
