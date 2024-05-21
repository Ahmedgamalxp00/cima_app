import 'package:cima_app/core/utils/shimmer_items.dart';
import 'package:cima_app/core/widgets/custom_error_widget.dart';
import 'package:cima_app/features/home_feature/presentation/manager/now_playing_movies_cubit/now_playing_movies_cubit.dart';
import 'package:cima_app/features/home_feature/presentation/views/widgets/now_playing_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NowPlayingSliderSection extends StatelessWidget {
  const NowPlayingSliderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NowPlayingMoviesCubit, NowPlayingMoviesState>(
        builder: (context, state) {
      if (state is NowPlayingMoviesSuccess) {
        return NowPlayingMoviesSlider(
          moviesList: state.movies,
        );
      } else if (state is NowPlayingMoviesFailure) {
        return CustomErrorWidget(errMassage: state.errMassage);
      } else {
        return sliderShemmer();
      }
    });
  }
}
