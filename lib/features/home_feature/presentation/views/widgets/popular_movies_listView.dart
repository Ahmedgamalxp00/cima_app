import 'package:cima_app/features/home_feature/domain/entities/movie_entity.dart';
import 'package:cima_app/features/home_feature/presentation/manager/popular_movies_cubit/popular_movies_cubit.dart';
import 'package:cima_app/features/home_feature/presentation/views/widgets/movie_list_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PopularMoviesListView extends StatefulWidget {
  const PopularMoviesListView({super.key, required this.moviesList});
  final List<MovieEntity> moviesList;

  @override
  State<PopularMoviesListView> createState() => _PopularMoviesListViewState();
}

class _PopularMoviesListViewState extends State<PopularMoviesListView> {
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
        await BlocProvider.of<PopularMoviesCubit>(context)
            .getPopularMovies(pageNumber: pageNumber++);
        isLoading = false;
      }
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.separated(
          controller: scrollController,
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, indext) {
            return MovieListImage(
              ontap: () {
                // context.push(AppRouter.kMovieDetailesView,
                //     extra: state.moviesList[indext].id);
              },
              url: widget.moviesList[indext].image,
            );
          },
          separatorBuilder: (context, indext) {
            return const SizedBox(
              width: 10,
            );
          },
          itemCount: widget.moviesList.length),
    );
  }
}
