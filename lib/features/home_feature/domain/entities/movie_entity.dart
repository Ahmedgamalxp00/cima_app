import 'package:hive/hive.dart';

part 'movie_entity.g.dart';

@HiveType(typeId: 1)
class MovieEntity {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String description;
  @HiveField(2)
  final String image;
  @HiveField(3)
  final String date;
  @HiveField(4)
  final num rate;
  @HiveField(5)
  final int movieId;
  MovieEntity(
      {required this.name,
      required this.description,
      required this.image,
      required this.date,
      required this.rate,
      required this.movieId});
}
