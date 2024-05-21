part of 'popular_movies_cubit.dart';

@immutable
sealed class PopularMoviesState {}

final class PopularMoviesInitial extends PopularMoviesState {}

final class PopularMoviesLoading extends PopularMoviesState {}

final class PopularMoviesSuccess extends PopularMoviesState {
  final List<MovieEntity> movies;
  PopularMoviesSuccess(this.movies);
}

final class PopularMoviesFailure extends PopularMoviesState {
  final String errMassage;
  PopularMoviesFailure(this.errMassage);
}
