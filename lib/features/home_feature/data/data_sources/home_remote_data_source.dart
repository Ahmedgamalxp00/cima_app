import 'package:cima_app/core/utils/api_services.dart';
import 'package:cima_app/features/home_feature/data/models/movie_model.dart';
import 'package:cima_app/features/home_feature/domain/entities/movie_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<MovieEntity>> getNowPlayingMovies();
  Future<List<MovieEntity>> getPopularMovies();
  Future<List<MovieEntity>> getTopRatedMovies();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiServices apiServices;
  HomeRemoteDataSourceImpl({required this.apiServices});
  @override
  Future<List<MovieEntity>> getNowPlayingMovies() async {
    var data = await apiServices.get(endPoint: 'now_playing');
    List<MovieEntity> moviesList =
        (data['results'] as List).map((e) => MovieModel.fromJson(e)).toList();
    return moviesList;
  }

  @override
  Future<List<MovieEntity>> getPopularMovies() async {
    var data = await apiServices.get(endPoint: 'popular');
    List<MovieEntity> moviesList =
        (data['results'] as List).map((e) => MovieModel.fromJson(e)).toList();
    return moviesList;
  }

  @override
  Future<List<MovieEntity>> getTopRatedMovies() async {
    var data = await apiServices.get(endPoint: 'top_rated');
    List<MovieEntity> moviesList =
        (data['results'] as List).map((e) => MovieModel.fromJson(e)).toList();
    return moviesList;
  }
}
