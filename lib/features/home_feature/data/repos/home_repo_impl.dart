import 'package:cima_app/core/errors/failures.dart';
import 'package:cima_app/features/home_feature/data/data_sources/home_local_data_source.dart';
import 'package:cima_app/features/home_feature/data/data_sources/home_remote_data_source.dart';
import 'package:cima_app/features/home_feature/domain/entities/movie_detailes_entity.dart';
import 'package:cima_app/features/home_feature/domain/entities/movie_entity.dart';
import 'package:cima_app/features/home_feature/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;

  HomeRepoImpl({
    required this.homeRemoteDataSource,
    required this.homeLocalDataSource,
  });
  @override
  Future<Either<Failure, List<MovieEntity>>> getNowPlayingMovies(
      {int pageNumber = 1}) async {
    List<MovieEntity> movies;

    try {
      movies = homeLocalDataSource.getNowPlayingMovies(pageNumber: pageNumber);
      if (movies.isNotEmpty) {
        return right(movies);
      }
      movies = await homeRemoteDataSource.getNowPlayingMovies(
          pageNumber: pageNumber);
      return right(movies);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDiorError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getPopularMovies(
      {int pageNumber = 1}) async {
    List<MovieEntity> movies;

    try {
      movies = homeLocalDataSource.getPopularMovies(pageNumber: pageNumber);
      if (movies.isNotEmpty) {
        return right(movies);
      }
      movies =
          await homeRemoteDataSource.getPopularMovies(pageNumber: pageNumber);
      return right(movies);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDiorError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getTopRatedMovies(
      {int pageNumber = 1}) async {
    List<MovieEntity> movies;

    try {
      movies = homeLocalDataSource.getTopRatedMovies(pageNumber: pageNumber);
      if (movies.isNotEmpty) {
        return right(movies);
      }
      movies =
          await homeRemoteDataSource.getTopRatedMovies(pageNumber: pageNumber);
      return right(movies);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDiorError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, MovieDetailsEntity>> getMovieDetails(
      {required int movieId}) async {
    MovieDetailsEntity movieDetailes;
    try {
      movieDetailes =
          await homeRemoteDataSource.getMoviesDetailes(movieId: movieId);
      return right(movieDetailes);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDiorError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getRecommendations(
      {required int movieId, int pageNumber = 1}) async {
    try {
      List<MovieEntity> recommendationsList = await homeRemoteDataSource
          .getRecommendations(movieId: movieId, pageNumber: pageNumber);
      return right(recommendationsList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDiorError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
