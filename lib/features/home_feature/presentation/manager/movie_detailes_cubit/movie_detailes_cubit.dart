import 'package:bloc/bloc.dart';
import 'package:cima_app/features/home_feature/domain/entities/movie_detailes_entity.dart';
import 'package:cima_app/features/home_feature/domain/use_cases/get_movie_detailes_usecase.dart';
import 'package:meta/meta.dart';

part 'movie_detailes_state.dart';

class MovieDetailesCubit extends Cubit<MovieDetailesState> {
  MovieDetailesCubit(this.getMovieDetailesUseCase)
      : super(MovieDetailesInitial());
  final GetMovieDetailesUseCase getMovieDetailesUseCase;

  Future<void> getMovieDetailes(int movieId) async {
    emit(MovieDetailesLoading());
    final result = await getMovieDetailesUseCase.call(movieId);
    result.fold(
      (failure) {
        emit(MovieDetailesFailure(failure.message));
      },
      (movieDetailes) {
        emit(MovieDetailesSuccess(movieDetailes));
      },
    );
  }
}
