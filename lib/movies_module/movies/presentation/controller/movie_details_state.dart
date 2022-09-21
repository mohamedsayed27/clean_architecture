part of 'movie_details_bloc.dart';

class MovieDetailsState extends Equatable {
  const MovieDetailsState({
    this.movieDetailsEntity,
    this.requestState = RequestState.isLoaded,
    this.movieDetailsMessage = '',
  });

  final MovieDetailsEntity? movieDetailsEntity;
  final RequestState requestState;
  final String movieDetailsMessage;

  MovieDetailsState copyWith({
    MovieDetailsEntity? movieDetailsEntity,
    RequestState? requestState,
    String? movieDetailsMessage,
  }) {
    return MovieDetailsState(
        movieDetailsEntity: movieDetailsEntity ?? this.movieDetailsEntity,
        requestState: requestState ?? this.requestState,
        movieDetailsMessage: movieDetailsMessage ?? this.movieDetailsMessage);
  }

  @override
  List<Object?> get props => [
        movieDetailsEntity,
        requestState,
        movieDetailsMessage,
      ];
}
