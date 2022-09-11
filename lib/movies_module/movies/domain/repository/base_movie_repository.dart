import 'package:clean_arch_ug/movies_module/core/error/failure.dart';
import 'package:clean_arch_ug/movies_module/movies/domain/entities/moveis_entity.dart';
import 'package:dartz/dartz.dart';

abstract class BaseMovieRepository {
  Future<Either<Failure,List<MoviesEntity>>> getNowPlayingMovies();

  Future<Either<Failure,List<MoviesEntity>>> getPopularMovies();

  Future<Either<Failure,List<MoviesEntity>>> getTopRatedMovies();
}
