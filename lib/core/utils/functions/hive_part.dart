import 'package:cima_app/core/constants.dart';
import 'package:cima_app/features/home_feature/domain/entities/movie_entity.dart';
import 'package:hive_flutter/adapters.dart';

Future<void> hivePart() async {
  await Hive.initFlutter();
  Hive.registerAdapter(MovieEntityAdapter());
  await Hive.openBox<MovieEntity>(kNowPlayingMoviesBox);
  await Hive.openBox<MovieEntity>(kPopularMoviesBox);
  await Hive.openBox<MovieEntity>(kTopRatedMoviesBox);
}
