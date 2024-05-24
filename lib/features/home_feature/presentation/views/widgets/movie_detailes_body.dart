import 'package:cima_app/core/utils/shimmer_items.dart';
import 'package:cima_app/core/widgets/custom_error_widget.dart';
import 'package:cima_app/features/home_feature/domain/entities/movie_detailes_entity.dart';
import 'package:cima_app/features/home_feature/domain/entities/movie_entity.dart';
import 'package:cima_app/features/home_feature/presentation/manager/recommendations_movies_cubit/recommendations_movies_cubit.dart';
import 'package:cima_app/features/home_feature/presentation/views/widgets/movie_detailes.dart';
import 'package:cima_app/features/home_feature/presentation/views/widgets/movies_detailes_appbar.dart';
import 'package:cima_app/features/home_feature/presentation/views/widgets/recommendation_gridview.dart';
import 'package:cima_app/features/home_feature/presentation/views/widgets/recommendations_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieDetailsBody extends StatefulWidget {
  const MovieDetailsBody({super.key, required this.movie});
  final MovieDetailsEntity movie;

  @override
  State<MovieDetailsBody> createState() => _MovieDetailsBodyState();
}

class _MovieDetailsBodyState extends State<MovieDetailsBody> {
  late ScrollController scrollController;
  List<MovieEntity> moviesList = [];
  int pageNumber = 1;
  bool isLoading = false;
  bool hasMoreData = true;
  @override
  void initState() {
    scrollController = ScrollController();
    scrollController.addListener(_scrollListener);
    super.initState();
  }

  void _scrollListener() async {
    var currentPosition = scrollController.position.pixels;
    var maxScroll = scrollController.position.maxScrollExtent;
    if (currentPosition >= 0.8 * maxScroll && hasMoreData) {
      if (!isLoading) {
        isLoading = true;
        await BlocProvider.of<RecommendationsMoviesCubit>(context)
            .getRecommendationsMovies(
                id: widget.movie.movieId, pageNumber: ++pageNumber);
        print(hasMoreData);
        isLoading = false;
      }
    }
  }

  @override
  void dispose() {
    scrollController.removeListener(_scrollListener);
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        MoviesDetailsAppBar(widget: widget),
        SliverToBoxAdapter(child: MoviesDetails(movie: widget.movie)),
        const RecommendationsHeader(),
        BlocConsumer<RecommendationsMoviesCubit, RecommendationsMoviesState>(
          listener: (context, state) {
            if (state is RecommendationsMoviesSuccess) {
              if (state.movies.isEmpty) {
                hasMoreData = false;
              } else {
                moviesList.addAll(state.movies);
              }
            }
          },
          builder: (context, state) {
            if (state is RecommendationsMoviesSuccess ||
                state is RecommendationsMoviesPaginationLoading ||
                state is RecommendationsMoviesPaginationFailure) {
              return RecommendationGridview(
                moviesList: moviesList,
              );
            } else if (state is RecommendationsMoviesFailure) {
              return SliverToBoxAdapter(
                  child: CustomErrorWidget(errMassage: state.errMassage));
            } else {
              return const GridViewShimmer();
            }
          },
        )
      ],
    );
  }
}
