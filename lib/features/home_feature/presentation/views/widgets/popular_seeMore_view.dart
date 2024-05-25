import 'package:cima_app/core/utils/shimmer_items.dart';
import 'package:cima_app/core/widgets/custom_error_widget.dart';
import 'package:cima_app/features/home_feature/domain/entities/movie_entity.dart';
import 'package:cima_app/features/home_feature/presentation/manager/popular_movies_cubit/popular_movies_cubit.dart';
import 'package:cima_app/features/home_feature/presentation/views/widgets/popular_see_more_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PopularSeeMoreView extends StatefulWidget {
  const PopularSeeMoreView({super.key});

  @override
  State<PopularSeeMoreView> createState() => _PopularSeeMoreViewState();
}

class _PopularSeeMoreViewState extends State<PopularSeeMoreView> {
  List<MovieEntity> movies = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: const Text(
          'Popular Movies',
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: BlocConsumer<PopularMoviesCubit, PopularMoviesState>(
        listener: (context, state) {
          if (state is PopularMoviesSuccess) {
            movies.addAll(state.movies);
          }
        },
        builder: (context, state) {
          if (state is PopularMoviesSuccess ||
              state is PopularMoviesPaginationLoading ||
              state is PopularMoviesPaginationFailure) {
            return PopularSeeMoreBody(moviesList: movies);
          } else if (state is PopularMoviesFailure) {
            return CustomErrorWidget(errMassage: state.errMassage);
          } else {
            return Center(
              child: seeMoreListViewShimmer(),
            );
          }
        },
      ),
    );
  }
}
