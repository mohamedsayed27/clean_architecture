import 'package:clean_arch_ug/movies_module/movies/domain/entities/recommendation_entity.dart';

class RecommendationModel extends RecommendationEntity{
  const RecommendationModel({required super.backdropPath, required super.id});

  factory RecommendationModel.fromJson(Map<String, dynamic> json){
    return RecommendationModel(
      backdropPath: json['backdrop_path'],
      id: json['id'],
    );
  }

}