import 'package:cima_app/core/utils/services_locator.dart';
import 'package:cima_app/features/home_feature/data/repos/home_repo_impl.dart';
import 'package:cima_app/features/home_feature/domain/use_cases/get_movie_detailes_usecase.dart';
import 'package:cima_app/features/home_feature/domain/use_cases/get_now_playing_movies_usecae.dart';
import 'package:cima_app/features/home_feature/domain/use_cases/get_popular_movies_usecae.dart';
import 'package:cima_app/features/home_feature/domain/use_cases/get_recommendations_usecase.dart';
import 'package:cima_app/features/home_feature/domain/use_cases/get_top_rated_movies_usecae.dart';
import 'package:cima_app/features/home_feature/presentation/manager/movie_detailes_cubit/movie_detailes_cubit.dart';
import 'package:cima_app/features/home_feature/presentation/manager/now_playing_movies_cubit/now_playing_movies_cubit.dart';
import 'package:cima_app/features/home_feature/presentation/manager/popular_movies_cubit/popular_movies_cubit.dart';
import 'package:cima_app/features/home_feature/presentation/manager/recommendations_movies_cubit/recommendations_movies_cubit.dart';
import 'package:cima_app/features/home_feature/presentation/manager/top_rated_movies_cubit/top_rated_movies_cubit.dart';
import 'package:cima_app/features/home_feature/presentation/views/home_view.dart';
import 'package:cima_app/features/home_feature/presentation/views/movie_detailes_view.dart';
import 'package:cima_app/features/home_feature/presentation/views/widgets/popular_seeMore_view.dart';
import 'package:cima_app/features/home_feature/presentation/views/widgets/topRated_seeMore_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kDetailsView = '/detailsView';
  static const kPopularSeeMoreView = '/popularSeeMoreView';
  static const kTopRatedSeeMoreView = '/topRatedSeeMoreView';
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => NowPlayingMoviesCubit(
                  GetNowPlayingMoviesUseCase(
                    homeRepo: getIt.get<HomeRepoImpl>(),
                  ),
                )..getNowPlayingMovies(),
              ),
              BlocProvider(
                create: (context) => PopularMoviesCubit(
                  GetPopularMoviesUseCase(
                    homeRepo: getIt.get<HomeRepoImpl>(),
                  ),
                )..getPopularMovies(),
              ),
              BlocProvider(
                create: (context) => TopRatedMoviesCubit(
                  GetTopRatedMoviesUseCase(
                    homeRepo: getIt<HomeRepoImpl>(),
                  ),
                )..getTopRatedMovies(),
              ),
            ],
            child: const HomeView(),
          );
        },
      ),
      GoRoute(
        path: kDetailsView,
        builder: (BuildContext context, GoRouterState state) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => MovieDetailesCubit(
                  GetMovieDetailesUseCase(
                    homeRepo: getIt.get<HomeRepoImpl>(),
                  ),
                )..getMovieDetailes(state.extra as int),
              ),
              BlocProvider(
                create: (context) => RecommendationsMoviesCubit(
                    GetRecommendationsUseCase(
                        homeRepo: getIt.get<HomeRepoImpl>()))
                  ..getRecommendationsMovies(
                      id: state.extra as int, pageNumber: 1),
              ),
            ],
            child: const MovieDetailesView(),
          );
        },
      ),
      GoRoute(
        path: kPopularSeeMoreView,
        builder: (BuildContext context, GoRouterState state) {
          return BlocProvider(
            create: (context) => PopularMoviesCubit(GetPopularMoviesUseCase(
              homeRepo: getIt.get<HomeRepoImpl>(),
            ))
              ..getPopularMovies(),
            child: const PopularSeeMoreView(),
          );
        },
      ),
      GoRoute(
        path: kTopRatedSeeMoreView,
        builder: (BuildContext context, GoRouterState state) {
          return BlocProvider(
            create: (context) => TopRatedMoviesCubit(GetTopRatedMoviesUseCase(
              homeRepo: getIt<HomeRepoImpl>(),
            ))
              ..getTopRatedMovies(),
            child: const TopRatedSeeMoreView(),
          );
        },
      )
    ],
  );
}
