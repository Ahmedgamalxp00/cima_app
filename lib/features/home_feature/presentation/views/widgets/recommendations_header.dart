import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class RecommendationsHeader extends StatelessWidget {
  const RecommendationsHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 24.0),
      sliver: SliverToBoxAdapter(
        child: FadeInUp(
          from: 20,
          child: Text(
            'More like this'.toUpperCase(),
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
              letterSpacing: 1.2,
            ),
          ),
        ),
      ),
    );
  }
}
