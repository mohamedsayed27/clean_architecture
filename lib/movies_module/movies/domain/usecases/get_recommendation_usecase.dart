import 'package:clean_arch_ug/movies_module/core/error/failure.dart';
import 'package:clean_arch_ug/movies_module/core/usecases/base_usecase.dart';
import 'package:clean_arch_ug/movies_module/core/utils/recommendation_parameters.dart';
import 'package:clean_arch_ug/movies_module/movies/domain/entities/recommendation_entity.dart';
import 'package:clean_arch_ug/movies_module/movies/domain/repository/base_movie_repository.dart';
import 'package:dartz/dartz.dart';

class GetRecommendationUseCase extends BaseUseCase<List<RecommendationEntity>, RecommendationParameters>{
  final BaseMovieRepository baseMovieRepository;

  GetRecommendationUseCase(this.baseMovieRepository);
  @override
  Future<Either<Failure, List<RecommendationEntity>>> call(RecommendationParameters parameters) async{
    return await baseMovieRepository.getRecommendedMovies(parameters);

  }

}