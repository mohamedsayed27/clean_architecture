import 'package:clean_arch_ug/movies_module/movies/domain/entities/generes_entity.dart';

class GeneresModel extends GeneresEntity{
  const GeneresModel({required super.name, required super.id});

  factory GeneresModel.fromJson(Map<String, dynamic> json){
    return GeneresModel(name: json["name"], id: json["id"]);
  }

}