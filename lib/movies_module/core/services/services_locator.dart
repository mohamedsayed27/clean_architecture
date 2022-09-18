import 'package:clean_arch_ug/movies_module/movies/data/datasources/movies_remote_data_source.dart';
import 'package:clean_arch_ug/movies_module/movies/data/repository/movies_repository.dart';
import 'package:clean_arch_ug/movies_module/movies/domain/repository/base_movie_repository.dart';
import 'package:clean_arch_ug/movies_module/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:clean_arch_ug/movies_module/movies/presentation/controller/movies_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;
class ServicesLocator{

  void init(){

    ///BLoC
    sl.registerFactory(() => MoviesBloc(sl()));

    ///USE CASES
    sl.registerLazySingleton(() => GetNowMoviesPlayingUseCase(sl()));

    ///REPOSITORY
    sl.registerLazySingleton<BaseMovieRepository>(() => MoviesRepository(sl()));

    ///DATA SOURCE
    sl.registerLazySingleton<BaseMoviesRemoteDatasource>(() => MoviesRemoteDatasource());
  }
}