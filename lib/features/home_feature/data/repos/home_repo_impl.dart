import 'package:cima_app/core/errors/failures.dart';
import 'package:cima_app/features/home_feature/data/data_sources/home_local_data_source.dart';
import 'package:cima_app/features/home_feature/data/data_sources/home_remote_data_source.dart';
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
  Future<Either<Failure, List<MovieEntity>>> getNowPlayingMovies() async {
    List<MovieEntity> movies;

    try {
      movies = homeLocalDataSource.getNowPlayingMovies();
      if (movies.isNotEmpty) {
        return right(movies);
      }
      movies = await homeRemoteDataSource.getNowPlayingMovies();
      return right(movies);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDiorError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getPopularMovies() async {
    List<MovieEntity> movies;

    try {
      movies = homeLocalDataSource.getPopularMovies();
      if (movies.isNotEmpty) {
        return right(movies);
      }
      movies = await homeRemoteDataSource.getPopularMovies();
      return right(movies);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDiorError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getTopRatedMovies() async {
    List<MovieEntity> movies;

    try {
      movies = homeLocalDataSource.getTopRatedMovies();
      if (movies.isNotEmpty) {
        return right(movies);
      }
      movies = await homeRemoteDataSource.getTopRatedMovies();
      return right(movies);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDiorError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
