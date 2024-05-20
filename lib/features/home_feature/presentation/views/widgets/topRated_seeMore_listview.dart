import 'package:cima_app/core/dummy1.dart';
import 'package:cima_app/features/home_feature/presentation/views/widgets/seeMore_item.dart';
import 'package:flutter/material.dart';

class TopRatedSeeMoreListView extends StatelessWidget {
  const TopRatedSeeMoreListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          'Top Rated Movies',
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.black.withOpacity(0.7),
      ),
      body: ListView.separated(
          physics: const BouncingScrollPhysics(),
          padding:
              const EdgeInsets.only(left: 10, right: 10, top: 90, bottom: 10),
          itemBuilder: (context, indext) {
            return SeeMoreItem(
              movie: moviesList[indext],
            );
          },
          separatorBuilder: (context, indext) {
            return const SizedBox(
              height: 10,
            );
          },
          itemCount: moviesList.length),
    );
  }
}
