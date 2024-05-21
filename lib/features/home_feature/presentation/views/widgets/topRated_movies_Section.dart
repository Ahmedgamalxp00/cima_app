import 'package:cima_app/core/utils/shimmer_items.dart';
import 'package:cima_app/core/widgets/custom_error_widget.dart';
import 'package:cima_app/features/home_feature/presentation/manager/top_rated_movies_cubit/top_rated_movies_cubit.dart';
import 'package:cima_app/features/home_feature/presentation/views/widgets/custom_section_title.dart';
import 'package:cima_app/features/home_feature/presentation/views/widgets/topRated_movies_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopRatedMoviesSection extends StatelessWidget {
  const TopRatedMoviesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomSectionTitle(
          title: 'Top Rated',
        ),
        BlocBuilder<TopRatedMoviesCubit, TopRatedMoviesState>(
          builder: (context, state) {
            if (state is TopRatedMoviesSuccess) {
              return TopRatedMoviesListView(moviesList: state.movies);
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
