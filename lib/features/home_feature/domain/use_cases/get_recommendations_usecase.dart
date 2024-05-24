import 'package:cima_app/core/errors/failures.dart';
import 'package:cima_app/features/home_feature/domain/entities/movie_entity.dart';
import 'package:cima_app/features/home_feature/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

class GetRecommendationsUseCase extends UseCase<List<MovieEntity>, int, int> {
  final HomeRepo homeRepo;

  GetRecommendationsUseCase({required this.homeRepo});
  @override
  Future<Either<Failure, List<MovieEntity>>> call(
      int param1, int param2) async {
    return await homeRepo.getRecommendations(
        movieId: param1, pageNumber: param2);
  }
}

abstract class UseCase<Type, Param1, Param2> {
  Future<Either<Failure, Type>> call(Param1 param1, Param2 param2);
}
