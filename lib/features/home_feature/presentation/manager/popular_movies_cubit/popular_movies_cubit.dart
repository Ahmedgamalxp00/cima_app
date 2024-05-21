import 'package:bloc/bloc.dart';
import 'package:cima_app/features/home_feature/domain/entities/movie_entity.dart';
import 'package:cima_app/features/home_feature/domain/use_cases/get_popular_movies_usecae.dart';
import 'package:meta/meta.dart';

part 'popular_movies_state.dart';

class PopularMoviesCubit extends Cubit<PopularMoviesState> {
  PopularMoviesCubit(this.getPopularMoviesUseCase)
      : super(PopularMoviesInitial());
  final GetPopularMoviesUseCase getPopularMoviesUseCase;

  Future<void> getPopularMovies() async {
    emit(PopularMoviesLoading());
    final result = await getPopularMoviesUseCase.call();
    result.fold(
      (failure) {
        emit(PopularMoviesFailure(failure.message));
      },
      (movies) {
        emit(PopularMoviesSuccess(movies));
      },
    );
  }
}
