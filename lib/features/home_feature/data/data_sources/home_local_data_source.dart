import 'package:cima_app/core/constants.dart';
import 'package:cima_app/features/home_feature/domain/entities/movie_entity.dart';
import 'package:hive/hive.dart';

abstract class HomeLocalDataSource {
  List<MovieEntity> getNowPlayingMovies();
  List<MovieEntity> getPopularMovies();
  List<MovieEntity> getTopRatedMovies();
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  List<MovieEntity> getNowPlayingMovies() {
    var box = Hive.box<MovieEntity>(kNowPlayingMoviesBox);
    return box.values.toList();
  }

  @override
  List<MovieEntity> getPopularMovies() {
    var box = Hive.box<MovieEntity>(kPopularMoviesBox);
    return box.values.toList();
  }

  @override
  List<MovieEntity> getTopRatedMovies() {
    var box = Hive.box<MovieEntity>(kTopRatedMoviesBox);
    return box.values.toList();
  }
}
