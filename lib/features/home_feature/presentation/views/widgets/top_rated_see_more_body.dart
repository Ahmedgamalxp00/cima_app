import 'package:cima_app/features/home_feature/domain/entities/movie_entity.dart';
import 'package:cima_app/features/home_feature/presentation/manager/top_rated_movies_cubit/top_rated_movies_cubit.dart';
import 'package:cima_app/features/home_feature/presentation/views/widgets/seeMore_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopRatedSeeMoreBody extends StatefulWidget {
  const TopRatedSeeMoreBody({
    super.key,
    required this.moviesList,
  });
  final List<MovieEntity> moviesList;
  @override
  State<TopRatedSeeMoreBody> createState() => _TopRatedSeeMoreBodyState();
}

class _TopRatedSeeMoreBodyState extends State<TopRatedSeeMoreBody> {
  late ScrollController scrollController;
  int pageNumber = 1;
  bool isLoading = false;
  @override
  void initState() {
    scrollController = ScrollController();
    scrollController.addListener(_scrollListner);
    super.initState();
  }

  void _scrollListner() async {
    var currentPosition = scrollController.position.pixels;
    var maxScroll = scrollController.position.maxScrollExtent;
    if (currentPosition >= 0.7 * maxScroll) {
      if (!isLoading) {
        isLoading = true;
        await BlocProvider.of<TopRatedMoviesCubit>(context)
            .getTopRatedMovies(pageNumber: ++pageNumber);
        isLoading = false;
      }
    }
  }

  @override
  void dispose() {
    scrollController.removeListener(_scrollListner);
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        controller: scrollController,
        physics: const BouncingScrollPhysics(),
        padding:
            const EdgeInsets.only(left: 10, right: 10, top: 90, bottom: 10),
        itemBuilder: (context, indext) {
          return SeeMoreItem(
            movie: widget.moviesList[indext],
          );
        },
        separatorBuilder: (context, indext) {
          return const SizedBox(
            height: 10,
          );
        },
        itemCount: widget.moviesList.length);
  }
}
