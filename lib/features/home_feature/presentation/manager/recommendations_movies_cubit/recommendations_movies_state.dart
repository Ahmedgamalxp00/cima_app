part of 'recommendations_movies_cubit.dart';

@immutable
sealed class RecommendationsMoviesState {}

final class RecommendationsMoviesInitial extends RecommendationsMoviesState {}

final class RecommendationsMoviesLoading extends RecommendationsMoviesState {}

final class RecommendationsMoviesPaginationLoading
    extends RecommendationsMoviesState {}

final class RecommendationsMoviesSuccess extends RecommendationsMoviesState {
  final List<MovieEntity> movies;
  RecommendationsMoviesSuccess(this.movies);
}

final class RecommendationsMoviesFailure extends RecommendationsMoviesState {
  final String errMassage;
  RecommendationsMoviesFailure(this.errMassage);
}

final class RecommendationsMoviesPaginationFailure
    extends RecommendationsMoviesState {
  final String errMassage;
  RecommendationsMoviesPaginationFailure(this.errMassage);
}
