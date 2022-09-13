import 'package:clean_arch_ug/movies_module/core/utils/enums.dart';
import 'package:clean_arch_ug/movies_module/movies/domain/entities/moveis_entity.dart';
import 'package:equatable/equatable.dart';

class MoviesState extends Equatable {
  final List<MoviesEntity> nowPlayinMovies;
  final RequestState requestState;
  final String nowPlayinMessage;

  const MoviesState({
    this.nowPlayinMovies = const [],
    this.requestState = RequestState.isLoading,
    this.nowPlayinMessage = '',
  });

  @override
  List<Object> get props => [
        nowPlayinMovies,
        requestState,
        nowPlayinMessage,
      ];
}
