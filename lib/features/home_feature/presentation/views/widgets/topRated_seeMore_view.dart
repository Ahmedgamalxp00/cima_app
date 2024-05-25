import 'package:cima_app/core/utils/shimmer_items.dart';
import 'package:cima_app/core/widgets/custom_error_widget.dart';
import 'package:cima_app/features/home_feature/domain/entities/movie_entity.dart';
import 'package:cima_app/features/home_feature/presentation/manager/top_rated_movies_cubit/top_rated_movies_cubit.dart';
import 'package:cima_app/features/home_feature/presentation/views/widgets/top_rated_see_more_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopRatedSeeMoreView extends StatefulWidget {
  const TopRatedSeeMoreView({super.key});

  @override
  State<TopRatedSeeMoreView> createState() => _TopRatedSeeMoreViewState();
}

class _TopRatedSeeMoreViewState extends State<TopRatedSeeMoreView> {
  List<MovieEntity> movies = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: const Text(
          'Top Rated Movies',
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: BlocConsumer<TopRatedMoviesCubit, TopRatedMoviesState>(
        listener: (context, state) {
          if (state is TopRatedMoviesSuccess) {
            movies.addAll(state.movies);
          }
        },
        builder: (context, state) {
          if (state is TopRatedMoviesSuccess ||
              state is TopRatedMoviesPaginationLoading ||
              state is TopRatedMoviesPaginationFailure) {
            return TopRatedSeeMoreBody(moviesList: movies);
          } else if (state is TopRatedMoviesFailure) {
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
