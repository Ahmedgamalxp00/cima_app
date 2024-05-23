import 'package:cima_app/core/constants.dart';
import 'package:cima_app/features/home_feature/domain/entities/movie_entity.dart';
import 'package:hive/hive.dart';

abstract class HomeLocalDataSource {
  List<MovieEntity> getNowPlayingMovies({int pageNumber = 1});
  List<MovieEntity> getPopularMovies({int pageNumber = 1});
  List<MovieEntity> getTopRatedMovies({int pageNumber = 1});
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  List<MovieEntity> getNowPlayingMovies({int pageNumber = 1}) {
    int startIndex = (pageNumber - 1) * 20;
    int endIndex = pageNumber * 20;

    var box = Hive.box<MovieEntity>(kNowPlayingMoviesBox);
    int totalLength = box.values.length;
    if (startIndex >= totalLength || endIndex > totalLength) {
      return [];
    }
    return box.values.toList().sublist(startIndex, endIndex);
  }

  @override
  List<MovieEntity> getPopularMovies({int pageNumber = 1}) {
    int startIndex = (pageNumber - 1) * 20;
    int endIndex = pageNumber * 20;
    var box = Hive.box<MovieEntity>(kPopularMoviesBox);
    int totalLength = box.values.length;
    if (startIndex >= totalLength || endIndex > totalLength) {
      return [];
    }
    return box.values.toList().sublist(startIndex, endIndex);
  }

  @override
  List<MovieEntity> getTopRatedMovies({int pageNumber = 1}) {
    int startIndex = (pageNumber - 1) * 20;
    int endIndex = pageNumber * 20;
    var box = Hive.box<MovieEntity>(kTopRatedMoviesBox);
    int totalLength = box.values.length;
    if (startIndex >= totalLength || endIndex > totalLength) {
      return [];
    }
    return box.values.toList().sublist(startIndex, endIndex);
  }
}
