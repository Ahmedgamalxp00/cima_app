part of 'movie_detailes_cubit.dart';

@immutable
sealed class MovieDetailesState {}

final class MovieDetailesInitial extends MovieDetailesState {}

final class MovieDetailesLoading extends MovieDetailesState {}

final class MovieDetailesSuccess extends MovieDetailesState {
  final MovieDetailesEntity movieDetailes;
  MovieDetailesSuccess(this.movieDetailes);
}

final class MovieDetailesFailure extends MovieDetailesState {
  final String errMessage;
  MovieDetailesFailure(this.errMessage);
}
