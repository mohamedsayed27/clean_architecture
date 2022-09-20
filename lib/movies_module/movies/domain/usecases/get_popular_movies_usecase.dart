import 'package:clean_arch_ug/movies_module/core/error/failure.dart';
import 'package:clean_arch_ug/movies_module/core/usecases/base_usecase.dart';
import 'package:clean_arch_ug/movies_module/movies/domain/entities/moveis_entity.dart';
import 'package:clean_arch_ug/movies_module/movies/domain/repository/base_movie_repository.dart';
import 'package:dartz/dartz.dart';

class GetPopularMoviesUseCase extends BaseUseCase<List<MoviesEntity>,NoParameters>{
  final BaseMovieRepository baseMovieRepository;

  GetPopularMoviesUseCase(this.baseMovieRepository);

  @override
  Future<Either<Failure,List<MoviesEntity>>> call(NoParameters parameters) async{
    return await baseMovieRepository.getPopularMovies();
  }



}