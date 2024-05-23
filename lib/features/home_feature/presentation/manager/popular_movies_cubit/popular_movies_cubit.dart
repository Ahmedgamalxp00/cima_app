import 'package:bloc/bloc.dart';
import 'package:cima_app/features/home_feature/domain/entities/movie_entity.dart';
import 'package:cima_app/features/home_feature/domain/use_cases/get_popular_movies_usecae.dart';
import 'package:meta/meta.dart';

part 'popular_movies_state.dart';

class PopularMoviesCubit extends Cubit<PopularMoviesState> {
  PopularMoviesCubit(this.getPopularMoviesUseCase)
      : super(PopularMoviesInitial());
  final GetPopularMoviesUseCase getPopularMoviesUseCase;

  Future<void> getPopularMovies({int pageNumber = 1}) async {
    if (pageNumber == 1) {
      emit(PopularMoviesLoading());
    } else {
      emit(PopularMoviesPaginationLoading());
    }

    final result = await getPopularMoviesUseCase.call(pageNumber);
    result.fold(
      (failure) {
        if (pageNumber == 1) {
          emit(PopularMoviesFailure(failure.message));
        } else {
          emit(PopularMoviesPaginationFailure(failure.message));
        }
      },
      (movies) {
        emit(PopularMoviesSuccess(movies));
      },
    );
  }
}
