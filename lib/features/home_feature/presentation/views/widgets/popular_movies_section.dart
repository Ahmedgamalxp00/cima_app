import 'package:cima_app/features/home_feature/presentation/views/widgets/custom_section_title.dart';
import 'package:cima_app/features/home_feature/presentation/views/widgets/popular_movies_listView.dart';
import 'package:flutter/material.dart';

class PopularMoviesSection extends StatelessWidget {
  const PopularMoviesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomSectionTitle(
          title: 'Popular',
        ),
        PopularMoviesListView(),
      ],
    );
  }
}
