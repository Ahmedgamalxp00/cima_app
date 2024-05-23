import 'package:cima_app/core/utils/shimmer_items.dart';
import 'package:cima_app/core/widgets/custom_error_widget.dart';
import 'package:cima_app/features/home_feature/presentation/manager/movie_detailes_cubit/movie_detailes_cubit.dart';
import 'package:cima_app/features/home_feature/presentation/views/widgets/movie_detailes_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieDetailesView extends StatelessWidget {
  const MovieDetailesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MovieDetailesCubit, MovieDetailesState>(
        builder: (context, state) {
          if (state is MovieDetailesSuccess) {
            return MovieDetailesBody(
              movie: state.movieDetailes,
            );
          } else if (state is MovieDetailesFailure) {
            return CustomErrorWidget(errMassage: state.errMessage);
          } else {
            return movieDetailsShemmer();
          }
        },
      ),
    );
  }
}
