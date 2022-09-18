import 'package:clean_arch_ug/movies_module/core/utils/enums.dart';
import 'package:clean_arch_ug/movies_module/movies/domain/entities/moveis_entity.dart';
import 'package:equatable/equatable.dart';

class MoviesState extends Equatable {
  final List<MoviesEntity> nowPlayingMovies;
  final RequestState requestState;
  final String nowPlayingMessage;

  const MoviesState({
    this.nowPlayingMovies = const [],
    this.requestState = RequestState.isLoading,
    this.nowPlayingMessage = '',
  });

  @override
  List<Object> get props => [
        nowPlayingMovies,
        requestState,
        nowPlayingMessage,
      ];
}
