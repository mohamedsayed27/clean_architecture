import 'package:bloc/bloc.dart';
import 'package:clean_arch_ug/movies_module/core/utils/enums.dart';
import 'package:clean_arch_ug/movies_module/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:clean_arch_ug/movies_module/movies/domain/usecases/get_popular_movies_usecase.dart';
import 'package:clean_arch_ug/movies_module/movies/domain/usecases/get_top_rated_movies_usecase.dart';
import 'package:clean_arch_ug/movies_module/movies/presentation/controller/movies_event.dart';
import 'package:clean_arch_ug/movies_module/movies/presentation/controller/movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowMoviesPlayingUseCase getNowMoviesPlayingUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;

  MoviesBloc(this.getNowMoviesPlayingUseCase, this.getPopularMoviesUseCase,
      this.getTopRatedMoviesUseCase)
      : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>((event, emit) async {
      final result = await getNowMoviesPlayingUseCase.execute();
      result.fold(
          (l) => emit(MoviesState(
              nowPlayingState: RequestState.isError,
              nowPlayingMessage: l.message)),
          (r) => emit(MoviesState(
              nowPlayingState: RequestState.isLoaded, nowPlayingMovies: r)));
    });

    on<GetPopularMoviesEvent>((event, emit) async {
      final result = await getPopularMoviesUseCase.execute();
      result.fold(
          (l) => emit(MoviesState(
              popularState: RequestState.isError, popularMessage: l.message)),
          (r) => emit(MoviesState(
              popularMovies: r, popularState: RequestState.isLoaded)));
    });

    on<GetTopRatedMoviesEvent>((event, emit) async {
      final result = await getTopRatedMoviesUseCase.execute();
      result.fold(
          (l) => emit(MoviesState(
              topRatedMessage: l.message, topRatedState: RequestState.isError)),
          (r) => emit(MoviesState(
              topRatedMovies: r, topRatedState: RequestState.isLoaded)));
    });
  }
}
