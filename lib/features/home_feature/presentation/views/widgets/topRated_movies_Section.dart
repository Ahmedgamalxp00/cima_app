import 'package:cima_app/core/utils/shimmer_items.dart';
import 'package:cima_app/core/widgets/custom_error_widget.dart';
import 'package:cima_app/features/home_feature/domain/entities/movie_entity.dart';
import 'package:cima_app/features/home_feature/presentation/manager/top_rated_movies_cubit/top_rated_movies_cubit.dart';
import 'package:cima_app/features/home_feature/presentation/views/widgets/custom_section_title.dart';
import 'package:cima_app/features/home_feature/presentation/views/widgets/topRated_movies_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopRatedMoviesSection extends StatefulWidget {
  const TopRatedMoviesSection({super.key});

  @override
  State<TopRatedMoviesSection> createState() => _TopRatedMoviesSectionState();
}

class _TopRatedMoviesSectionState extends State<TopRatedMoviesSection> {
  List<MovieEntity> movies = [];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomSectionTitle(
          title: 'Top Rated',
        ),
        BlocConsumer<TopRatedMoviesCubit, TopRatedMoviesState>(
          listener: (context, state) {
            if (state is TopRatedMoviesSuccess) {
              movies.addAll(state.movies);
            }
          },
          builder: (context, state) {
            if (state is TopRatedMoviesSuccess ||
                state is TopRatedMoviesPaginationLoading ||
                state is TopRatedMoviesPaginationFailure) {
              return TopRatedMoviesListView(moviesList: movies);
            } else if (state is TopRatedMoviesFailure) {
              return CustomErrorWidget(errMassage: state.errMassage);
            } else {
              return Center(
                child: listViewShimmer(),
              );
            }
          },
        ),
      ],
    );
  }
}
