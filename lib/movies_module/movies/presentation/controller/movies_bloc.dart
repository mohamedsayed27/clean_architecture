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
    on<GetNowPlayingMoviesEvent>(_getNowPlayingMethod);

    on<GetPopularMoviesEvent>(_getPopularMethod);

    on<GetTopRatedMoviesEvent>(_getTopRatedMethod);
  }


  Future<void> _getNowPlayingMethod(event, emit) async {
    final result = await getNowMoviesPlayingUseCase();
    result.fold(
            (l) => emit(
            state.copyWith(
                nowPlayingState:RequestState.isError,
                nowPlayingMessage: l.message
            )),
            (r) => emit(
            state.copyWith(
                nowPlayingState: RequestState.isLoaded,
                nowPlayingMovies: r
            )));
  }

  Future<void> _getPopularMethod(event, emit) async {
    final result = await getPopularMoviesUseCase();
    result.fold(
            (l) => emit(state.copyWith(
            popularState: RequestState.isError, popularMessage: l.message)),
            (r) => emit(state.copyWith(
            popularMovies: r, popularState: RequestState.isLoaded)));
  }

  Future<void> _getTopRatedMethod(event, emit) async {
    final result = await getTopRatedMoviesUseCase();
    result.fold(
            (l) => emit(state.copyWith(
            topRatedMessage: l.message, topRatedState: RequestState.isError)),
            (r) => emit(state.copyWith(
            topRatedMovies: r, topRatedState: RequestState.isLoaded)));
  }

}
