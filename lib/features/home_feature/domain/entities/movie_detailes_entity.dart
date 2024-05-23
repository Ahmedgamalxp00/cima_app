class MovieDetailesEntity {
  final String movieBackdropPath;
  final List<String> movieGenres;
  final int movieId;
  final String movieOverview;
  final String movieReleaseDate;
  final int movieRuntime;
  final String movieTitle;
  final double movieVoteAverage;

  MovieDetailesEntity(
      {required this.movieBackdropPath,
      required this.movieGenres,
      required this.movieId,
      required this.movieOverview,
      required this.movieReleaseDate,
      required this.movieRuntime,
      required this.movieTitle,
      required this.movieVoteAverage});
}
