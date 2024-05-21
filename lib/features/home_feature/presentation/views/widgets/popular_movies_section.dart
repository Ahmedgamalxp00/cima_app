import 'package:cima_app/core/utils/shimmer_items.dart';
import 'package:cima_app/core/widgets/custom_error_widget.dart';
import 'package:cima_app/features/home_feature/presentation/manager/popular_movies_cubit/popular_movies_cubit.dart';
import 'package:cima_app/features/home_feature/presentation/views/widgets/custom_section_title.dart';
import 'package:cima_app/features/home_feature/presentation/views/widgets/popular_movies_listView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PopularMoviesSection extends StatelessWidget {
  const PopularMoviesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomSectionTitle(
          title: 'Popular',
        ),
        BlocBuilder<PopularMoviesCubit, PopularMoviesState>(
          builder: (context, state) {
            if (state is PopularMoviesSuccess) {
              return PopularMoviesListView(moviesList: state.movies);
            } else if (state is PopularMoviesFailure) {
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
