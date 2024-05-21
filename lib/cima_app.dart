import 'package:cima_app/core/constants.dart';
import 'package:cima_app/core/routing/app_router.dart';
import 'package:cima_app/core/utils/services_locator.dart';
import 'package:cima_app/features/home_feature/data/repos/home_repo_impl.dart';
import 'package:cima_app/features/home_feature/domain/use_cases/get_now_playing_movies_usecae.dart';
import 'package:cima_app/features/home_feature/domain/use_cases/get_popular_movies_usecae.dart';
import 'package:cima_app/features/home_feature/domain/use_cases/get_top_rated_movies_usecae.dart';
import 'package:cima_app/features/home_feature/presentation/manager/now_playing_movies_cubit/now_playing_movies_cubit.dart';
import 'package:cima_app/features/home_feature/presentation/manager/popular_movies_cubit/popular_movies_cubit.dart';
import 'package:cima_app/features/home_feature/presentation/manager/top_rated_movies_cubit/top_rated_movies_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CimaApp extends StatelessWidget {
  const CimaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NowPlayingMoviesCubit(GetNowPlayingMoviesUseCase(
            homeRepo: getIt.get<HomeRepoImpl>(),
          ))
            ..getNowPlayingMovies(),
        ),
        BlocProvider(
            create: (context) => PopularMoviesCubit(GetPopularMoviesUseCase(
                  homeRepo: getIt.get<HomeRepoImpl>(),
                ))
                  ..getPopularMovies()),
        BlocProvider(
            create: (context) => TopRatedMoviesCubit(GetTopRatedMoviesUseCase(
                  homeRepo: getIt<HomeRepoImpl>(),
                ))
                  ..getTopRatedMovies()),
      ],
      child: MaterialApp.router(
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kBackgroundColor,
        ),
        debugShowCheckedModeBanner: false,
        routerConfig: router,
      ),
    );
  }
}
