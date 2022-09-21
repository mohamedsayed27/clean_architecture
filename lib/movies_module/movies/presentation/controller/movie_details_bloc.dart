import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:clean_arch_ug/movies_module/core/utils/enums.dart';
import 'package:clean_arch_ug/movies_module/core/utils/movie_details_parameters.dart';
import 'package:clean_arch_ug/movies_module/movies/domain/entities/movie_details_entity.dart';
import 'package:clean_arch_ug/movies_module/movies/domain/usecases/movie_details_usecase.dart';
import 'package:equatable/equatable.dart';
part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final MovieDetailsUseCase movieDetailsUseCase;

  MovieDetailsBloc(this.movieDetailsUseCase)
      : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetailsEvent);
  }

  FutureOr<void> _getMovieDetailsEvent(
      GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    final result =
        await movieDetailsUseCase(MovieDetailsParameters(id: event.id));
    result.fold(
        (l) => emit(state.copyWith(
            movieDetailsMessage: l.message, requestState: RequestState.isError)),
        (r) => emit(state.copyWith(
            requestState: RequestState.isLoaded, movieDetailsEntity: r)));
  }
}
