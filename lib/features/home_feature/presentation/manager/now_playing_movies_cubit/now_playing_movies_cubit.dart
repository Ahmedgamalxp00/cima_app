import 'package:cima_app/features/home_feature/domain/entities/movie_entity.dart';
import 'package:cima_app/features/home_feature/domain/use_cases/get_now_playing_movies_usecae.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'now_playing_movies_state.dart';

class NowPlayingMoviesCubit extends Cubit<NowPlayingMoviesState> {
  NowPlayingMoviesCubit(this.getNowPlayingMoviesUseCase)
      : super(NowPlayingMoviesInitial());
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;

  Future<void> getNowPlayingMovies() async {
    emit(NowPlayingMoviesLoading());
    final result = await getNowPlayingMoviesUseCase.call();
    result.fold((failure) {
      emit(NowPlayingMoviesFailure(failure.message));
    }, (movies) {
      emit(NowPlayingMoviesSuccess(movies));
    });
  }
}
