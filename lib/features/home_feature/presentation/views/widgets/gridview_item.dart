import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cima_app/core/constants.dart';
import 'package:cima_app/features/home_feature/domain/entities/movie_entity.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class GridViewItem extends StatelessWidget {
  const GridViewItem({super.key, required this.movie});
  final MovieEntity movie;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // context.push(AppRouter.kMovieDetailesView, extra: movie.id);
      },
      child: FadeInUp(
        from: 20,
        duration: const Duration(milliseconds: 500),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(4.0)),
          child: CachedNetworkImage(
            imageUrl: imageUrl(movie.image),
            placeholder: (context, url) => Shimmer.fromColors(
              baseColor: Colors.grey[850]!,
              highlightColor: Colors.grey[800]!,
              child: Container(
                height: 170.0,
                width: 120.0,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
            height: 180.0,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
