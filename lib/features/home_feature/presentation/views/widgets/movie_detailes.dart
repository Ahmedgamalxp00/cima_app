import 'package:animate_do/animate_do.dart';
import 'package:cima_app/features/home_feature/domain/entities/movie_detailes_entity.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MoviesDetails extends StatelessWidget {
  const MoviesDetails({super.key, required this.movie});
  final MovieDetailsEntity movie;
  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      from: 20,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(movie.movieTitle,
                style: GoogleFonts.poppins(
                  fontSize: 23,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.2,
                )),
            const SizedBox(height: 8.0),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 2.0,
                    horizontal: 8.0,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: Text(
                    movie.movieReleaseDate.split('-')[0],
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(width: 16.0),
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 20.0,
                    ),
                    const SizedBox(width: 4.0),
                    Text(
                      (movie.movieVoteAverage / 2).toStringAsFixed(1),
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1.2,
                      ),
                    ),
                    const SizedBox(width: 4.0),
                    Text(
                      '(${movie.movieVoteAverage})',
                      style: const TextStyle(
                        fontSize: 1.0,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 16.0),
                Text(
                  _showDuration(movie.movieRuntime),
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.2,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            Text(
              movie.movieOverview,
              style: const TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w400,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              _showGenres(movie.movieGenres),
              style: const TextStyle(
                color: Colors.white54,
                fontSize: 12.0,
                fontWeight: FontWeight.w500,
                letterSpacing: 1.2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String _showGenres(List<String> genres) {
  String result = '';
  for (var genre in genres) {
    result += '$genre, ';
  }

  if (result.isEmpty) {
    return result;
  }

  return result.substring(0, result.length - 2);
}

String _showDuration(int runtime) {
  final int hours = runtime ~/ 60;
  final int minutes = runtime % 60;

  if (hours > 0) {
    return '${hours}h ${minutes}m';
  } else {
    return '${minutes}m';
  }
}
