import 'package:cima_app/core/errors/failures.dart';
import 'package:cima_app/core/use_cases/no_param_use_case.dart';
import 'package:cima_app/features/home_feature/domain/entities/movie_entity.dart';
import 'package:cima_app/features/home_feature/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

class GetNowPlayingMoviesUseCase extends UseCase<List<MovieEntity>> {
  final HomeRepo homeRepo;

  GetNowPlayingMoviesUseCase({required this.homeRepo});

  @override
  Future<Either<Failure, List<MovieEntity>>> call() async {
    return await homeRepo.getNowPlayingMovies();
  }
}
