import 'package:cima_app/core/dummy1.dart';
import 'package:cima_app/features/home_feature/presentation/views/widgets/movie_list_image.dart';
import 'package:flutter/material.dart';

class PopularMoviesListView extends StatelessWidget {
  const PopularMoviesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, indext) {
            return MovieListImage(
              ontap: () {
                // context.push(AppRouter.kMovieDetailesView,
                //     extra: state.moviesList[indext].id);
              },
              url: moviesList[indext].backdropPath!,
            );
          },
          separatorBuilder: (context, indext) {
            return const SizedBox(
              width: 10,
            );
          },
          itemCount: moviesList.length),
    );
  }
}
