import 'package:cima_app/features/home_feature/data/models/movie_model.dart';
import 'package:cima_app/features/home_feature/domain/entities/movie_entity.dart';

List<MovieEntity> mapMoviesList(Map<String, dynamic> data) {
  List<MovieEntity> moviesList = [];
  for (var movie in data['results']) {
    moviesList.add(MovieModel.fromJson(movie));
  }
  return moviesList;
}
