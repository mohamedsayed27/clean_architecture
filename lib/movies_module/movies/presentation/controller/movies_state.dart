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

  MoviesState copyWith({
    List<MoviesEntity>? nowPlayingMovies,
    RequestState? nowPlayingState,
    String? nowPlayingMessage,
    List<MoviesEntity>? popularMovies,
    RequestState? popularState,
    String? popularMessage,
    List<MoviesEntity>? topRatedMovies,
    RequestState? topRatedState,
    String? topRatedMessage,
  }) {
    return MoviesState(
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
      nowPlayingState: nowPlayingState ?? this.nowPlayingState,
      nowPlayingMessage: nowPlayingMessage ?? this.nowPlayingMessage,
      popularMovies: popularMovies ?? this.popularMovies,
      popularState: popularState ?? this.popularState,
      popularMessage: popularMessage ?? this.popularMessage,
      topRatedMovies: topRatedMovies ?? this.topRatedMovies,
      topRatedState: topRatedState ?? this.topRatedState,
      topRatedMessage: topRatedMessage ?? this.topRatedMessage,
    );
  }

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
