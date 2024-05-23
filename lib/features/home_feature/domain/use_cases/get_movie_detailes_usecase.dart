import 'package:cima_app/core/errors/failures.dart';
import 'package:cima_app/core/use_cases/param_use_case.dart';
import 'package:cima_app/features/home_feature/domain/entities/movie_detailes_entity.dart';
import 'package:cima_app/features/home_feature/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

class GetMovieDetailesUseCase extends UseCase<MovieDetailesEntity, int> {
  final HomeRepo homeRepo;

  GetMovieDetailesUseCase({required this.homeRepo});

  @override
  Future<Either<Failure, MovieDetailesEntity>> call(int params) async {
    return await homeRepo.getMovieDetails(movieId: params);
  }
}
