import 'package:cima_app/core/constants.dart';
import 'package:cima_app/core/networking/api_services.dart';
import 'package:cima_app/core/utils/functions/map_movies_list.dart';
import 'package:cima_app/core/utils/functions/save_movies_local.dart';
import 'package:cima_app/features/home_feature/data/models/movie_detailes_model/movie/movie.detailes.model.dart';
import 'package:cima_app/features/home_feature/domain/entities/movie_detailes_entity.dart';
import 'package:cima_app/features/home_feature/domain/entities/movie_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<MovieEntity>> getNowPlayingMovies({int pageNumber = 1});
  Future<List<MovieEntity>> getPopularMovies({int pageNumber = 1});
  Future<List<MovieEntity>> getTopRatedMovies({int pageNumber = 1});
  Future<MovieDetailesEntity> getMoviesDetailes({required int movieId});
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiServices apiServices;
  HomeRemoteDataSourceImpl({required this.apiServices});
  @override
  Future<List<MovieEntity>> getNowPlayingMovies({int pageNumber = 1}) async {
    var data = await apiServices.get(
        endPoint: 'now_playing', param: '&page=$pageNumber');

    List<MovieEntity> moviesList = mapMoviesList(data);
    saveMoviesLocal(moviesList, kNowPlayingMoviesBox);

    return moviesList;
  }

  @override
  Future<List<MovieEntity>> getPopularMovies({int pageNumber = 1}) async {
    var data =
        await apiServices.get(endPoint: 'popular', param: '&page=$pageNumber');
    List<MovieEntity> moviesList = mapMoviesList(data);

    saveMoviesLocal(moviesList, kPopularMoviesBox);
    return moviesList;
  }

  @override
  Future<List<MovieEntity>> getTopRatedMovies({int pageNumber = 1}) async {
    var data = await apiServices.get(
        endPoint: 'top_rated', param: '&page=$pageNumber');
    List<MovieEntity> moviesList = mapMoviesList(data);
    saveMoviesLocal(moviesList, kTopRatedMoviesBox);
    return moviesList;
  }

  @override
  Future<MovieDetailesEntity> getMoviesDetailes({required int movieId}) async {
    var data = await apiServices.get(endPoint: '$movieId');
    MovieDetailesEntity movieDetailes = MovieDetailesModel.fromJson(data);
    return movieDetailes;
  }
}
