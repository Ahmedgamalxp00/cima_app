import 'package:cima_app/features/home_feature/presentation/views/widgets/custom_section_title.dart';
import 'package:cima_app/features/home_feature/presentation/views/widgets/topRated_movies_listview.dart';
import 'package:flutter/material.dart';

class TopRatedMoviesSection extends StatelessWidget {
  const TopRatedMoviesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomSectionTitle(
          title: 'Top Rated',
        ),
        TopRatedMoviesListView(),
      ],
    );
  }
}
