import 'package:clean_arch_ug/movies_module/core/error/failure.dart';
import 'package:clean_arch_ug/movies_module/core/utils/movie_details_parameters.dart';
import 'package:clean_arch_ug/movies_module/core/utils/recommendation_parameters.dart';
import 'package:clean_arch_ug/movies_module/movies/domain/entities/moveis_entity.dart';
import 'package:clean_arch_ug/movies_module/movies/domain/entities/movie_details_entity.dart';
import 'package:clean_arch_ug/movies_module/movies/domain/entities/recommendation_entity.dart';
import 'package:dartz/dartz.dart';

abstract class BaseMovieRepository {
  Future<Either<Failure,List<MoviesEntity>>> getNowPlayingMovies();

  Future<Either<Failure,List<MoviesEntity>>> getPopularMovies();

  Future<Either<Failure,List<MoviesEntity>>> getTopRatedMovies();

  Future<Either<Failure,MovieDetailsEntity>> getMovieDetails(MovieDetailsParameters parameters);

  Future<Either<Failure,List<RecommendationEntity>>> getRecommendedMovies(RecommendationParameters parameters);
}
