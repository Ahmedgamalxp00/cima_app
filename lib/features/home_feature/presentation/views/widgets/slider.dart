import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cima_app/core/constants.dart';
import 'package:cima_app/core/dummy1.dart';
import 'package:flutter/material.dart';

class MoviesSlider extends StatelessWidget {
  const MoviesSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 7),
        height: 400.0,
        viewportFraction: 1.0,
      ),
      items: moviesList.map((item) {
        return GestureDetector(
          // onTap: ()=>
          //     context.push(AppRouter.kMovieDetailesView, extra: item.id),
          child: Stack(children: [
            ShaderMask(
              shaderCallback: (rect) {
                return const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    // fromLTRB
                    Colors.transparent,
                    Colors.black,
                    Colors.black,
                    Colors.black,
                  ],
                  stops: [0, 1, 0, 0],
                ).createShader(
                  Rect.fromLTRB(0, 0, rect.width, rect.height),
                );
              },
              blendMode: BlendMode.dstOut,
              child: CachedNetworkImage(
                height: 560.0,
                imageUrl: imageUrl(item.backdropPath!),
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              // top: 30.0,
              bottom: -1,
              width: MediaQuery.of(context).size.width,
              height: 170,
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [
                    kBackgroundColor,
                    Colors.transparent,
                  ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.circle,
                        color: Colors.redAccent,
                        size: 16.0,
                      ),
                      const SizedBox(width: 4.0),
                      Text(
                        'Now Playing'.toUpperCase(),
                        style: const TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Text(
                    item.title!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ),
              ],
            ),
          ]),
        );
      }).toList(),
    );
  }
}
