class MovieEntity {
  final String name;
  final String description;
  final String image;
  final String releaseDate;
  final double rate;

  MovieEntity(
      {required this.name,
      required this.description,
      required this.image,
      required this.releaseDate,
      required this.rate});
}
