import 'package:bloc/bloc.dart';
import 'package:cima_app/features/home_feature/domain/entities/movie_entity.dart';
import 'package:cima_app/features/home_feature/domain/use_cases/get_recommendations_usecase.dart';
import 'package:meta/meta.dart';

part 'recommendations_movies_state.dart';

class RecommendationsMoviesCubit extends Cubit<RecommendationsMoviesState> {
  RecommendationsMoviesCubit(this.getRecommendationsMoviesUseCase)
      : super(RecommendationsMoviesInitial());
  final GetRecommendationsUseCase getRecommendationsMoviesUseCase;

  Future<void> getRecommendationsMovies(
      {required int id, required int pageNumber}) async {
    if (pageNumber == 1) {
      emit(RecommendationsMoviesLoading());
    } else {
      emit(RecommendationsMoviesPaginationLoading());
    }

    var result = await getRecommendationsMoviesUseCase.call(id, pageNumber);
    result.fold(
      (failure) {
        if (pageNumber == 1) {
          emit(RecommendationsMoviesFailure(failure.message));
        } else {
          emit(RecommendationsMoviesPaginationFailure(failure.message));
        }
      },
      (movies) {
        emit(RecommendationsMoviesSuccess(movies));
      },
    );
  }
}
