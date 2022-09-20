import 'package:clean_arch_ug/movies_module/core/error/failure.dart';
import 'package:clean_arch_ug/movies_module/core/usecases/base_usecase.dart';
import 'package:clean_arch_ug/movies_module/core/utils/movie_details_parameters.dart';
import 'package:clean_arch_ug/movies_module/movies/domain/entities/movie_details_entity.dart';
import 'package:clean_arch_ug/movies_module/movies/domain/repository/base_movie_repository.dart';
import 'package:dartz/dartz.dart';

class MovieDetailsUseCase extends BaseUseCase<MovieDetailsEntity, MovieDetailsParameters>{
  final BaseMovieRepository baseMovieRepository;

  MovieDetailsUseCase(this.baseMovieRepository);
  @override
  Future<Either<Failure, MovieDetailsEntity>> call(MovieDetailsParameters parameters) async{
    return await baseMovieRepository.getMovieDetails(parameters);
  }

}
