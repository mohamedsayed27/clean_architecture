import 'package:clean_arch_ug/movies_module/core/utils/enums.dart';
import 'package:clean_arch_ug/movies_module/movies/domain/entities/moveis_entity.dart';
import 'package:equatable/equatable.dart';

class MoviesState extends Equatable {
  final List<MoviesEntity> nowPlayingMovies;
  final RequestState nowPlayingState;
  final String nowPlayingMessage;

  final List<MoviesEntity> popularMovies;
  final RequestState popularState;
  final String popularMessage;

  final List<MoviesEntity> topRatedMovies;
  final RequestState topRatedState;
  final String topRatedMessage;

  const MoviesState({
    this.nowPlayingMovies = const [],
    this.nowPlayingState = RequestState.isLoading,
    this.nowPlayingMessage = '',
    this.popularMovies = const [],
    this.popularState = RequestState.isLoading,
    this.popularMessage = '',
    this.topRatedMovies = const [],
    this.topRatedState = RequestState.isLoading,
    this.topRatedMessage = '',
  });

  @override
  List<Object> get props => [
        nowPlayingMovies,
        nowPlayingState,
        nowPlayingMessage,
        popularMovies,
        popularMessage,
        popularState,
        topRatedMessage,
        topRatedState,
        topRatedMovies,
      ];
}
