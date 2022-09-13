import 'package:equatable/equatable.dart';

class MoviesEntity extends Equatable {
  final int id;
  final String title;
  final String backdropPath;
  final double voteAverage;
  final String releaseDate;
  final List<int> genderIdes;
  final String overview;

  const MoviesEntity({
    required this.id,
    required this.title,
    required this.backdropPath,
    required this.voteAverage,
    required this.genderIdes,
    required this.overview,
    required this.releaseDate,
  });

  @override
  List<Object> get props => [
        id,
        title,
        backdropPath,
        voteAverage,
        genderIdes,
        overview,
        releaseDate,
      ];
}
