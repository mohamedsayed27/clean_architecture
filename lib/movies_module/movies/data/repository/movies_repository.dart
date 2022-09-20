import 'package:clean_arch_ug/movies_module/core/error/exception.dart';
import 'package:clean_arch_ug/movies_module/core/error/failure.dart';
import 'package:clean_arch_ug/movies_module/core/utils/movie_details_parameters.dart';
import 'package:clean_arch_ug/movies_module/movies/data/datasources/movies_remote_data_source.dart';
import 'package:clean_arch_ug/movies_module/movies/domain/entities/moveis_entity.dart';
import 'package:clean_arch_ug/movies_module/movies/domain/entities/movie_details_entity.dart';
import 'package:clean_arch_ug/movies_module/movies/domain/repository/base_movie_repository.dart';
import 'package:dartz/dartz.dart';

class MoviesRepository extends BaseMovieRepository{
  final BaseMoviesRemoteDatasource baseMoviesRemoteDatasource;

  MoviesRepository(this.baseMoviesRemoteDatasource);
  @override
  Future<Either<Failure,List<MoviesEntity>>> getNowPlayingMovies() async{
    final result = await baseMoviesRemoteDatasource.getNowPlayingMovies();
    try{
      return Right(result);
    }on ServerModelException catch(error){
      return left(ServerFailure(error.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<MoviesEntity>>> getPopularMovies() async{
    final result = await baseMoviesRemoteDatasource.getPopularMovies();
    try{
      return Right(result);
    }on ServerModelException catch(error){
      return left(ServerFailure(error.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<MoviesEntity>>> getTopRatedMovies() async{
    final result = await baseMoviesRemoteDatasource.getTopRatedMovies();
    try{
      return Right(result);
    }on ServerModelException catch(error){
      return left(ServerFailure(error.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MovieDetailsEntity>> getMovieDetails(MovieDetailsParameters parameters) async{
    final result = await baseMoviesRemoteDatasource.getMovieDetails(parameters);
    try{
      return Right(result);
    }on ServerModelException catch(error){
      return left(ServerFailure(error.errorMessageModel.statusMessage));
    }
  }



}