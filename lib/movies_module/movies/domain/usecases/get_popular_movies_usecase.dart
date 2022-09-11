import 'package:clean_arch_ug/movies_module/core/error/failure.dart';
import 'package:clean_arch_ug/movies_module/movies/domain/entities/moveis_entity.dart';
import 'package:clean_arch_ug/movies_module/movies/domain/repository/base_movie_repository.dart';
import 'package:dartz/dartz.dart';

class GetPopularMoviesUseCase{
  final BaseMovieRepository baseMovieRepository;

  GetPopularMoviesUseCase(this.baseMovieRepository);

  Future<Either<Failure,List<MoviesEntity>>> execute() async{
    return await baseMovieRepository.getPopularMovies();
  }

}