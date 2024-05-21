import 'package:cima_app/features/home_feature/domain/entities/movie_entity.dart';
import 'package:cima_app/features/home_feature/domain/use_cases/get_top_rated_movies_usecae.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'top_rated_movies_state.dart';

class TopRatedMoviesCubit extends Cubit<TopRatedMoviesState> {
  TopRatedMoviesCubit(this.getTopRatedMoviesUseCase)
      : super(TopRatedMoviesInitial());
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;

  Future<void> getTopRatedMovies() async {
    emit(TopRatedMoviesLoading());
    final result = await getTopRatedMoviesUseCase.call();
    result.fold(
      (failure) {
        emit(TopRatedMoviesFailure(failure.message));
      },
      (movies) {
        emit(TopRatedMoviesSuccess(movies));
      },
    );
  }
}
