import 'package:animate_do/animate_do.dart';
import 'package:cima_app/features/home_feature/data/models/movie_detailes_model/movie/movie.detailes.model.dart';
import 'package:cima_app/features/home_feature/domain/entities/movie_detailes_entity.dart';
import 'package:cima_app/features/home_feature/presentation/views/widgets/appBar_background.dart';
import 'package:cima_app/features/home_feature/presentation/views/widgets/movie_detailes.dart';
import 'package:cima_app/features/home_feature/presentation/views/widgets/recommendation_gridview.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MovieDetailesBody extends StatelessWidget {
  const MovieDetailesBody({super.key, required this.movie});
  final MovieDetailesEntity movie;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          actions: [
            IconButton(
                onPressed: () {
                  context.pop();
                },
                icon: const Icon(Icons.home_filled))
          ],
          pinned: true,
          expandedHeight: 250.0,
          flexibleSpace: FlexibleSpaceBar(
            background: AppBarBackGround(
              url: movie.movieBackdropPath,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: MoviesDetailes(
            movie: movie,
          ),
        ),
        SliverPadding(
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
        ),
        const RecommendationGridview(),
      ],
    );
  }
}
