import 'package:cima_app/core/errors/failures.dart';
import 'package:cima_app/core/use_cases/param_use_case.dart';
import 'package:cima_app/features/home_feature/domain/entities/movie_entity.dart';
import 'package:cima_app/features/home_feature/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

class GetNowPlayingMoviesUseCase extends UseCase<List<MovieEntity>, int> {
  final HomeRepo homeRepo;

  GetNowPlayingMoviesUseCase({required this.homeRepo});

  @override
  Future<Either<Failure, List<MovieEntity>>> call([int params = 1]) async {
    return await homeRepo.getNowPlayingMovies(pageNumber: params);
  }
}
