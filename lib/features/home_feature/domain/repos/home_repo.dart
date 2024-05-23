import 'package:cima_app/core/errors/failures.dart';
import 'package:cima_app/features/home_feature/domain/entities/movie_detailes_entity.dart';
import 'package:cima_app/features/home_feature/domain/entities/movie_entity.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<MovieEntity>>> getNowPlayingMovies(
      {int pageNumber = 1});
  Future<Either<Failure, List<MovieEntity>>> getPopularMovies(
      {int pageNumber = 1});
  Future<Either<Failure, List<MovieEntity>>> getTopRatedMovies(
      {int pageNumber = 1});

  Future<Either<Failure, MovieDetailesEntity>> getMovieDetails(
      {required int movieId});
  Future<Either<Failure, List<MovieEntity>>> getRecommendations(
      {required int movieId});
}
