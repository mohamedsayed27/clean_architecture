import 'package:clean_arch_ug/movies_module/core/error/exception.dart';
import 'package:clean_arch_ug/movies_module/core/error/failure.dart';
import 'package:clean_arch_ug/movies_module/movies/data/datasources/movies_remote_data_source.dart';
import 'package:clean_arch_ug/movies_module/movies/domain/entities/moveis_entity.dart';
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
  Future<Either<Failure, List<MoviesEntity>>> getPopularMovies() {
    // TODO: implement getPopularMovies
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<MoviesEntity>>> getTopRatedMovies() {
    // TODO: implement getTopRatedMovies
    throw UnimplementedError();
  }

}