import 'package:clean_arch_ug/movies_module/movies/domain/entities/moveis_entity.dart';

class MoviesModel extends MoviesEntity {
  const MoviesModel({
    required super.id,
    required super.title,
    required super.backdropPath,
    required super.voteAverage,
    required super.genderIdes,
    required super.overview,
    required super.releaseDate,
  });

  factory MoviesModel.fromJson(Map<String, dynamic> json) {
    return MoviesModel(
        id: json['id'],
        title: json['title'],
        backdropPath: json['backdrop_path'],
        voteAverage: json['vote_average'].toDouble(),
        genderIdes: List<int>.from(json['genre_ids'].map((e) => e)),
        overview: json['overview'],
        releaseDate: json['release_date']
    );
  }
}
