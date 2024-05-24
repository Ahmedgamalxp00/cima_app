import 'package:cima_app/features/home_feature/presentation/views/widgets/appBar_background.dart';
import 'package:cima_app/features/home_feature/presentation/views/widgets/movie_detailes_body.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MoviesDetailsAppBar extends StatelessWidget {
  const MoviesDetailsAppBar({
    super.key,
    required this.widget,
  });

  final MovieDetailsBody widget;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      actions: [
        IconButton(
            onPressed: () {
              context.pop();
            },
            icon: const Icon(Icons.home_filled))
      ],
      pinned: true,
      expandedHeight: 250.0,
      flexibleSpace: FlexibleSpaceBar(
        background: AppBarBackGround(
          url: widget.movie.movieBackdropPath,
        ),
      ),
    );
  }
}
