import 'package:cima_app/features/home_feature/domain/entities/movie_entity.dart';
import 'package:hive/hive.dart';

void saveMoviesLocal(List<MovieEntity> moviesList, String boxName) {
  var box = Hive.box<MovieEntity>(boxName);
  box.addAll(moviesList);
}
